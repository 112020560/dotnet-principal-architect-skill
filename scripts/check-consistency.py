#!/usr/bin/env python3
"""Read-only consistency audit for the EAF rule catalog. Never modifies files."""

import hashlib
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CATALOG = ROOT / "docs" / "00-rule-catalog.md"
ID_RE = re.compile(r"\b([A-Z]+)-(\d{3})\b")
CATALOG_ROW_RE = re.compile(r"^\|\s*([A-Z]+-\d{3})\s*\|\s*(.+?)\s*\|\s*(docs/\S+\.md)\s*\|\s*$")
DOC_HEADER_RE = re.compile(r"^#\s+(?:Rule\s+)?([A-Z]+-\d{3})\s+—\s+(.+?)\s*$")
SKIP_DIRS = {".git", "framework", "prompts"}

errors: list[str] = []
warnings: list[str] = []


def normalize(text: str) -> str:
    return " ".join(re.sub(r"[^a-z0-9 ]", "", text.lower().replace("-", " ")).split())


def markdown_files():
    for path in ROOT.rglob("*.md"):
        if not SKIP_DIRS.intersection(path.relative_to(ROOT).parts):
            yield path


def load_catalog():
    rules = {}
    for line_no, line in enumerate(CATALOG.read_text().splitlines(), 1):
        match = CATALOG_ROW_RE.match(line)
        if not match:
            continue
        rule_id, description, ref = match.groups()
        if rule_id in rules:
            errors.append(f"catalog: {rule_id} is listed twice (line {line_no})")
        rules[rule_id] = (description.rstrip("."), ref)
    return rules


def check_catalog_against_docs(catalog):
    headers_by_doc = defaultdict(dict)
    for ref in {ref for _, ref in catalog.values()}:
        doc = ROOT / ref
        if not doc.exists():
            errors.append(f"catalog references missing file {ref}")
            continue
        for line in doc.read_text().splitlines():
            match = DOC_HEADER_RE.match(line)
            if match:
                rule_id, title = match.groups()
                if rule_id in headers_by_doc[ref]:
                    errors.append(f"{ref}: {rule_id} has two rule sections")
                headers_by_doc[ref][rule_id] = title

    for rule_id, (description, ref) in sorted(catalog.items()):
        title = headers_by_doc.get(ref, {}).get(rule_id)
        if title is None:
            errors.append(f"{rule_id}: in catalog but no rule section in {ref}")
        elif normalize(title) != normalize(description):
            warnings.append(f"{rule_id}: catalog says \"{description}\" but {ref} says \"{title}\"")

    for ref, headers in headers_by_doc.items():
        for rule_id in headers:
            if rule_id not in catalog:
                errors.append(f"{ref}: defines {rule_id}, which is not in the catalog")
            elif catalog[rule_id][1] != ref:
                errors.append(f"{rule_id}: defined in {ref} but catalog points to {catalog[rule_id][1]}")


def check_references(catalog):
    prefixes = {rule_id.split("-")[0] for rule_id in catalog}
    for path in markdown_files():
        if path == CATALOG:
            continue
        for line_no, line in enumerate(path.read_text().splitlines(), 1):
            for prefix, number in ID_RE.findall(line):
                rule_id = f"{prefix}-{number}"
                if prefix in prefixes and rule_id not in catalog:
                    errors.append(f"{path.relative_to(ROOT)}:{line_no}: cites {rule_id}, which does not exist")


def check_duplicate_files():
    for folder in ("reviews", "scorecards", "playbooks", "assessments", "certifications", "templates"):
        by_hash = defaultdict(list)
        for path in sorted((ROOT / folder).glob("*.md")):
            content = path.read_bytes()
            if content.strip():
                by_hash[hashlib.md5(content).hexdigest()].append(path.name)
        for names in by_hash.values():
            if len(names) > 1:
                errors.append(f"{folder}/: identical files {', '.join(names)}")


def main():
    catalog = load_catalog()
    if not catalog:
        print("Could not parse any rules from the catalog.")
        return 2

    check_catalog_against_docs(catalog)
    check_references(catalog)
    check_duplicate_files()

    print(f"Catalog rules parsed: {len(catalog)}\n")
    for title, items in (("ERRORS", errors), ("WARNINGS (wording differs)", warnings)):
        print(f"{title}: {len(items)}")
        for item in items:
            print(f"  - {item}")
        print()

    if not errors and not warnings:
        print("OK — catalog, rule docs, and every citation are consistent.")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
