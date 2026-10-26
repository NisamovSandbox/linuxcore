#!/usr/bin/env python3
"""Valida los registros de comandos con el esquema JSON oficial del repositorio.

Errores (el script falla):
  - La ficha no cumple comando.schema.json.
  - El campo "id" no coincide con el nombre del archivo.
  - El campo "categoria" no coincide con la carpeta donde está la ficha.
  - Hay dos fichas con el mismo "id".

Avisos (el script no falla; usar --avisos para ver el detalle):
  - Comando destructivo con nivel "bajo" o "medio".
  - Comando destructivo sin advertencias.
  - Comando destructivo que no requiere confirmación.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

from jsonschema import Draft202012Validator, FormatChecker

ROOT = Path(__file__).resolve().parents[2]
COMMANDS_DIR = ROOT / "json" / "comandos"
SCHEMA_PATH = ROOT / ".github" / "schemas" / "comando.schema.json"


def check_consistency(path: Path, instance: dict) -> list[str]:
    """Comprobaciones que el esquema JSON no puede expresar."""
    problems: list[str] = []
    rel = path.relative_to(ROOT)

    if instance.get("id") != path.stem:
        problems.append(
            f"{rel}: id: el id '{instance.get('id')}' debe coincidir con el nombre del archivo '{path.stem}'"
        )

    categoria = (instance.get("clasificacion") or {}).get("categoria")
    if categoria != path.parent.name:
        problems.append(
            f"{rel}: clasificacion/categoria: '{categoria}' debe coincidir con la carpeta '{path.parent.name}'"
        )

    return problems


def check_security(path: Path, instance: dict) -> dict[str, str]:
    """Avisos de coherencia del bloque de seguridad. Devuelve {tipo_de_aviso: ruta}."""
    seguridad = instance.get("seguridad") or {}
    if not seguridad.get("destructivo"):
        return {}

    rel = str(path.relative_to(ROOT))
    warnings: dict[str, str] = {}
    if seguridad.get("nivel") in ("bajo", "medio"):
        warnings["destructivo con nivel bajo o medio"] = rel
    if not seguridad.get("advertencias"):
        warnings["destructivo sin advertencias"] = rel
    if not seguridad.get("requiere_confirmacion"):
        warnings["destructivo sin requiere_confirmacion"] = rel
    return warnings


def main() -> int:
    show_warnings = "--avisos" in sys.argv[1:]

    try:
        schema = json.loads(SCHEMA_PATH.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        print(f"[ERROR] No se pudo cargar el esquema {SCHEMA_PATH}: {error}")
        return 1

    Draft202012Validator.check_schema(schema)
    validator = Draft202012Validator(schema, format_checker=FormatChecker())
    files = sorted(COMMANDS_DIR.rglob("*.json"))
    errors: list[str] = []
    warnings: dict[str, list[str]] = {}
    seen_ids: dict[str, Path] = {}

    for path in files:
        try:
            instance = json.loads(path.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as error:
            errors.append(f"{path.relative_to(ROOT)}: JSON inválido: {error}")
            continue

        for error in validator.iter_errors(instance):
            location = "/".join(str(part) for part in error.absolute_path) or "$"
            errors.append(f"{path.relative_to(ROOT)}: {location}: {error.message}")

        if not isinstance(instance, dict):
            continue

        errors.extend(check_consistency(path, instance))

        ficha_id = instance.get("id")
        if ficha_id in seen_ids:
            errors.append(
                f"{path.relative_to(ROOT)}: id: '{ficha_id}' duplicado (ya existe en {seen_ids[ficha_id].relative_to(ROOT)})"
            )
        else:
            seen_ids[ficha_id] = path

        for kind, rel in check_security(path, instance).items():
            warnings.setdefault(kind, []).append(rel)

    if warnings:
        for kind, rutas in sorted(warnings.items()):
            print(f"[AVISO] {len(rutas)} fichas: {kind}.")
            if show_warnings:
                for ruta in rutas:
                    print(f"  - {ruta}")
        if not show_warnings:
            print("[AVISO] Use --avisos para ver el detalle. Los avisos no hacen fallar la validación.")

    if errors:
        print(f"[ERROR] Validación fallida: {len(errors)} problema(s) en {len(files)} archivo(s).")
        for error in errors:
            print(f"- {error}")
        return 1

    print(f"[OK] {len(files)} archivos JSON cumplen comando.schema.json y las comprobaciones de coherencia.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
