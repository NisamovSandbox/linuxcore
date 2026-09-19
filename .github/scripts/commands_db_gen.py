import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from db_common import build_database  # noqa: E402

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    source = os.path.join(script_dir, "..", "..", "comandos")
    output = os.path.join(script_dir, "..", "db", "commands.json")
    build_database(source, output, label="comandos")

if __name__ == "__main__":
    main()
