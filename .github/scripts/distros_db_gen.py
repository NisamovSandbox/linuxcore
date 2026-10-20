#!/usr/bin/env python3
from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
SOURCE_DIR = ROOT / "json" / "distribuciones"
OUTPUT_PATH = ROOT / ".github" / "db" / "distros.json"

REQUIRED_STRING_FIELDS = (
    "nombre",
    "descripcion",
    "web_oficial",
    "fecha_origen",
    "distribucion_base",
)
REQUIRED_LIST_FIELDS = ("autores", "gestor_paquetes", "fuentes")


def load_distributions() -> list[dict[str, Any]]:
    if not SOURCE_DIR.is_dir():
        raise RuntimeError(f"No existe el directorio de distribuciones: {SOURCE_DIR}")

    files = sorted(SOURCE_DIR.glob("*.json"), key=lambda path: path.name.casefold())
    if not files:
        raise RuntimeError(f"No se encontraron archivos JSON en: {SOURCE_DIR}")

    distributions: list[dict[str, Any]] = []
    for file_path in files:
        try:
            with file_path.open("r", encoding="utf-8") as file:
                data = json.load(file)
        except (OSError, json.JSONDecodeError) as error:
            raise RuntimeError(f"No se pudo leer JSON válido en {file_path}: {error}") from error

        if not isinstance(data, dict):
            raise RuntimeError(f"El documento debe contener un objeto JSON: {file_path}")

        for field in REQUIRED_STRING_FIELDS:
            if not isinstance(data.get(field), str):
                raise RuntimeError(f"El campo '{field}' debe ser una cadena en {file_path}")
        if not data["nombre"].strip():
            raise RuntimeError(f"El campo 'nombre' no puede estar vacío en {file_path}")

        for field in REQUIRED_LIST_FIELDS:
            value = data.get(field)
            if not isinstance(value, list) or not all(isinstance(item, str) for item in value):
                raise RuntimeError(f"El campo '{field}' debe ser una lista de cadenas en {file_path}")

        distribution = dict(data)
        distribution["archivo_fuente"] = file_path.relative_to(ROOT).as_posix()
        distributions.append(distribution)

    distributions.sort(key=lambda item: (item["nombre"].casefold(), item["archivo_fuente"]))
    return distributions


def build_distros_db() -> None:
    try:
        distributions = load_distributions()
        OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)
        database = {
            "_meta": {"total_registros": len(distributions)},
            "distribuciones": distributions,
        }
        with OUTPUT_PATH.open("w", encoding="utf-8", newline="\n") as file:
            json.dump(database, file, indent=2, ensure_ascii=False)
            file.write("\n")
    except (OSError, RuntimeError) as error:
        print(f"[ERROR] {error}", file=sys.stderr)
        raise SystemExit(1) from error

    print(f"[OK] Distribuciones recopiladas: {len(distributions)}")
    print(f"[OK] Base de datos: {OUTPUT_PATH}")


if __name__ == "__main__":
    build_distros_db()