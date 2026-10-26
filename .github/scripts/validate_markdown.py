#!/usr/bin/env python3
"""Comprueba que los enlaces e imágenes relativos de los archivos Markdown apuntan a archivos que existen."""

from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[2]
IGNORE_DIRS = {".git", ".venv", "node_modules", ".idea", "__pycache__"}
EXTERNAL_PREFIXES = (
    "http://",
    "https://",
    "mailto:",
    "tel:",
    "#",
    "data:",
    "javascript:",
)

# Enlaces [texto](ruta) e imágenes ![alt](ruta).
LINK_PATTERN = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
# Bloques de código delimitados con ``` o ~~~ (los enlaces de ejemplo no se validan).
FENCE_PATTERN = re.compile(r"^(`{3,}|~{3,}).*?^\1[ \t]*$", re.MULTILINE | re.DOTALL)


def mask_code_blocks(text: str) -> str:
    """Sustituye el contenido de los bloques de código por saltos de línea para conservar la numeración."""
    return FENCE_PATTERN.sub(lambda match: "\n" * match.group(0).count("\n"), text)


def normalize_target(file_path: Path, raw_target: str) -> Path | None:
    target = raw_target.strip().split()[0].strip("<>")
    if not target or target.startswith(EXTERNAL_PREFIXES):
        return None

    # Un enlace a un archivo puede llevar ancla (archivo.md#seccion) o parámetros: solo cuenta el archivo.
    target = unquote(target.split("#", 1)[0].split("?", 1)[0])
    if not target:
        return None

    if target.startswith("/"):
        return (ROOT / target.lstrip("/")).resolve()

    return (file_path.parent / target).resolve()


def validate_markdown_file(file_path: Path) -> list[str]:
    problems: list[str] = []
    text = mask_code_blocks(file_path.read_text(encoding="utf-8"))

    for match in LINK_PATTERN.finditer(text):
        raw_target = match.group(1).strip()
        if not raw_target:
            continue

        target_path = normalize_target(file_path, raw_target)
        if target_path is None:
            continue

        if not target_path.exists():
            line = text.count("\n", 0, match.start()) + 1
            problems.append(
                f"{file_path.relative_to(ROOT)}:{line}: enlace roto -> {raw_target}"
            )

    return problems


def iter_markdown_files() -> list[Path]:
    files: list[Path] = []
    for path in ROOT.rglob("*.md"):
        if any(part in IGNORE_DIRS for part in path.relative_to(ROOT).parts):
            continue
        files.append(path)
    return sorted(files)


def main() -> int:
    errors: list[str] = []
    markdown_files = iter_markdown_files()

    for file_path in markdown_files:
        errors.extend(validate_markdown_file(file_path))

    if errors:
        print("Validación de Markdown fallida.")
        for error in errors:
            print(f"- {error}")
        return 1

    print(f"Validación de Markdown correcta para {len(markdown_files)} archivos .md")
    return 0


if __name__ == "__main__":
    sys.exit(main())
