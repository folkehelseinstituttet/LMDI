#!/usr/bin/env python3
"""Skann den genererte output/en/*.html for gjenvaerende norsk tekst.

Komplementerer sjekk-oversettelser.py: den sjekker FSH-kilden (om felter har en
translation-extension), mens denne sjekker den FAKTISK genererte engelske HTML-en
og fanger restnorsk fra template, breadcrumbs, IG Publisher-fraser, narrative osv.
som ikke stammer fra et FSH-felt.

Deterministisk og kun lesende. Gjenbruker is_no-heuristikken fra
sjekk-oversettelser.py slik at norsk-deteksjonen holdes ett sted.
"""
from __future__ import annotations

import argparse
import importlib.util
import sys
from collections import defaultdict
from html.parser import HTMLParser
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SJEKK = ROOT / "scripts" / "sjekk-oversettelser.py"
DOKLAG = ROOT / "scripts" / "lag-en-doklag.py"

# Innhold i disse taggene er ikke synlig prosa: script/style er kode, og pre/code
# rommer Turtle/JSON/XML-representasjonene av ressursene (format-dumps, ikke tekst
# som skal oversettes).
SKIP_TAGS = {"script", "style", "pre", "code"}


def _load_module(path: Path, name: str):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    sys.modules[name] = mod
    spec.loader.exec_module(mod)
    return mod


def load_helpers():
    is_no = _load_module(SJEKK, "sjekk_oversettelser").is_no
    is_identifier = _load_module(DOKLAG, "doklag")._looks_like_profile_identifier
    return is_no, is_identifier


def _is_only_identifiers(segment: str, is_identifier) -> bool:
    # FHIR-instansnavn opptrer som ren lenketekst/tabellceller, ev. med en
    # ressurstype-prefiks: "MedicationRequest/Rekvirering-Cellegift". De skal beholde
    # identiteten sin pa engelsk og er ikke uoversatt prosa.
    parts = [p for p in segment.split("/") if p]
    return bool(parts) and all(is_identifier(p) for p in parts)


class TextExtractor(HTMLParser):
    """Henter synlige tekstnoder, hopper over script/style."""

    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.skip_depth = 0
        self.segments: list[str] = []

    def handle_starttag(self, tag: str, attrs) -> None:
        if tag in SKIP_TAGS:
            self.skip_depth += 1

    def handle_endtag(self, tag: str) -> None:
        if tag in SKIP_TAGS and self.skip_depth > 0:
            self.skip_depth -= 1

    def handle_data(self, data: str) -> None:
        if self.skip_depth:
            return
        text = data.strip()
        if text:
            self.segments.append(text)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Skann output/en for restnorsk.")
    parser.add_argument("--en-dir", default=None, help="Sti til output/en. Default LMDI/output/en.")
    parser.add_argument("--limit", type=int, default=50, help="Maks antall unike strenger som listes i terminalen.")
    parser.add_argument("--report", default=None, help="Skriv full UTF-8-rapport til denne filen.")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    # Windows-terminalen er cp1252; norsk tekst og usynlige tegn ma ikke krasje printen.
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    is_no, is_identifier = load_helpers()
    en_dir = Path(args.en_dir).resolve() if args.en_dir else ROOT / "LMDI" / "output" / "en"
    if not en_dir.exists():
        raise SystemExit(f"Fant ikke {en_dir} — bygg IG og kjor lag-en-doklag.py forst.")

    files = sorted(en_dir.glob("*.html"))

    # norsk streng -> sett av filer den forekommer i
    hits: dict[str, set[str]] = defaultdict(set)
    files_with_hits: set[str] = set()

    for f in files:
        extractor = TextExtractor()
        extractor.feed(f.read_text(encoding="utf-8"))
        extractor.close()
        for seg in extractor.segments:
            if _is_only_identifiers(seg, is_identifier):
                continue
            if is_no(seg):
                hits[seg].add(f.name)
                files_with_hits.add(f.name)

    total_pages = len(files)
    # Sorter etter utbredelse (template-tekst rammer mange sider) og deretter alfabetisk.
    ordered = sorted(hits.items(), key=lambda kv: (-len(kv[1]), kv[0].lower()))

    summary = (
        f"=== Skannet {total_pages} sider i {en_dir} ===\n"
        f"Sider med gjenvaerende norsk: {len(files_with_hits)} av {total_pages}\n"
        f"Unike norske strenger: {len(hits)}\n"
    )
    print(summary)
    print(f"=== Topp {min(args.limit, len(ordered))} norske strenger (antall sider) ===")
    for seg, file_set in ordered[: args.limit]:
        oneline = " ".join(seg.split())
        if len(oneline) > 110:
            oneline = oneline[:107] + "..."
        print(f"  {len(file_set):4d}x | {oneline}")
    if len(ordered) > args.limit:
        print(f"\n  ... {len(ordered) - args.limit} flere unike strenger (--report for full liste)")

    if args.report:
        report_path = Path(args.report).resolve()
        lines = [summary, "=== Alle norske strenger (antall sider | streng | eksempelfil) ==="]
        for seg, file_set in ordered:
            oneline = " ".join(seg.split())
            example = sorted(file_set)[0]
            lines.append(f"{len(file_set):4d}x | {oneline}  [{example}]")
        report_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
        print(f"\nFull rapport skrevet til {report_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
