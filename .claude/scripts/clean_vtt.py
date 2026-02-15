#!/usr/bin/env python3
"""Clean VTT subtitle files: strip headers, timestamps, tags, and deduplicate lines."""

import re
import sys


def clean_vtt(filepath: str) -> str:
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()

    cleaned = []
    prev_line = ""

    for line in lines:
        line = line.strip()

        # Skip WEBVTT header, empty lines, and numeric cue IDs
        if not line or line.startswith("WEBVTT") or line.startswith("Kind:") or line.startswith("Language:"):
            continue
        if re.match(r"^\d+$", line):
            continue
        # Skip timestamp lines
        if "-->" in line:
            continue

        # Remove HTML-style tags (<c>, </c>, <00:00:00.000>, etc.)
        line = re.sub(r"<[^>]+>", "", line)
        line = line.strip()

        if not line:
            continue

        # Deduplicate consecutive identical lines (auto-captions repeat)
        if line != prev_line:
            cleaned.append(line)
            prev_line = line

    return "\n".join(cleaned)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: clean_vtt.py <file.vtt>", file=sys.stderr)
        sys.exit(1)

    print(clean_vtt(sys.argv[1]))
