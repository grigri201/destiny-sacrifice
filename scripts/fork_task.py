#!/usr/bin/env python3
"""
fork_task.py  —  Copy the current .tasks/<timestamp>.<taskName>.md file
                 to .tasks/<NOW>.<taskName>.md

Usage:  python fork_task.py <absolute-path-to-current-file>
"""

import re
import shutil
import sys
from datetime import datetime
from pathlib import Path

def dasherize(text):
    """
    Convert a string to a file path friendly format by replacing non-alphanumeric
    characters with dashes and removing consecutive dashes.
    """
    # Replace non-alphanumeric characters (except dashes) with dashes
    dasherized = re.sub(r'[^a-zA-Z0-9-]', '-', text)
    # Replace consecutive dashes with a single dash
    dasherized = re.sub(r'-+', '-', dasherized)
    # Remove leading and trailing dashes
    dasherized = dasherized.strip('-')
    return dasherized


def main():
    if len(sys.argv) < 2:
        sys.exit("Need a file path argument")

    src = Path(sys.argv[1]).resolve()
    provided_name = sys.argv[2] if len(sys.argv) > 2 else ""

    # derive default task name from the file:
    parts = src.name.split(".")
    default_name = ".".join(parts[1:-1]) if len(parts) >= 3 else ""

    task_name = provided_name or default_name
    
    # Dasherize the task name to make it file path friendly
    task_name = dasherize(task_name)

    # ── build destination path ------------------------------------------
    now = datetime.now().strftime("%Y-%m-%dT%H-%M")   # e.g. 2025-04-26T10-45
    dest = src.parent / f"{now}.{task_name}.md"

    # ── copy -------------------------------------------------------------
    shutil.copy2(src, dest)
    # print(f"✅  Created {dest}")

if __name__ == "__main__":
    main()
