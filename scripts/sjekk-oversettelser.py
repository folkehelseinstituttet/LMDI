#!/usr/bin/env python3
"""Revisjon av oversettelsesdekning for den engelske /en/-speilingen.

Sjekken er kildebasert og deterministisk: den leser fsh-generated og bruker de
samme erstatningsparene som lag-en-doklag.py, slik at den ikke avhenger av en
ferdigbygd (og potensielt utdatert) output/en.

To kategorier rapporteres:

  A) MANGLER ANVENDBAR OVERSETTELSE
     Norsk tekstfelt (ressurs-description/title, element short/definition/comment,
     CodeSystem-concept) som verken har en engelsk translation-extension eller
     dekkes av et manuelt erstatningspar. Disse forblir norske i output.

  B) OVERSATT, MEN MS-TOOLTIP BEHOLDER NORSK
     Element-definition som HAR engelsk oversettelse, men der IG Publisher rendrer
     hover-tooltippen som "<definition uten siste punktum> (this element must be
     supported)", og postprosessoren likevel ikke får byttet ut teksten.

Kun lesende. Endrer ingenting.
"""
from __future__ import annotations

import argparse
import importlib.util
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DOKLAG = ROOT / "scripts" / "lag-en-doklag.py"

# Norsk-heuristikk: æøå eller vanlige norske ord/bøyninger som sjelden er gyldig engelsk.
# Heuristikken er bevisst bred for å fange korte beskrivelser; den kan ha enkelte
# falske positive/negative og er ikke en erstatning for manuell gjennomgang.
NO = re.compile(
    r"[æøå]|(?<!\w)(?:ikke|skal|være|som|med|til|av|og|eller|når|dersom|brukes|"
    r"angir|inneholder|opplysninger|legemiddel|legemidlet|pasient|pasienten|"
    r"helsepersonell|virkestoff|innsending|identifikator|fødselsnummer|bør|denne|"
    r"dette|hvis|fra|for|organisasjon|behandling|rekvirering|administrering|navnet|"
    r"angivelse|benyttes|kuren|kilde|kodesystem|kodeverk|norsk|norske|komplett|"
    r"kommune|kommunenummer|bestemt|merkevare|pakning|dose|styrke|minste|enhet|"
    r"institusjon|institusjoner|denne|hentet|begrenset)(?!\w)",
    re.IGNORECASE,
)

# Ord som også er gyldige engelske og derfor ikke alene skal markere norsk tekst.
_EN_SAFE = re.compile(r"(?<!\w)(?:for|dose)(?!\w)", re.IGNORECASE)


def is_no(s) -> bool:
    if not isinstance(s, str):
        return False
    # Krev minst ett treff som ikke bare er et engelsk-gyldig ord ("for", "dose")
    hits = [mm.group(0) for mm in NO.finditer(s)]
    return any(not _EN_SAFE.fullmatch(h) for h in hits)


def load_doklag():
    spec = importlib.util.spec_from_file_location("doklag", DOKLAG)
    mod = importlib.util.module_from_spec(spec)
    sys.modules["doklag"] = mod
    spec.loader.exec_module(mod)
    return mod


def get_en(mod, holder):
    if not isinstance(holder, dict):
        return None
    for ext in holder.get("extension", []):
        if ext.get("url") != mod.TRANSLATION_EXT_URL:
            continue
        d = {s.get("url"): s for s in ext.get("extension", [])}
        if d.get("lang", {}).get("valueCode") == "en":
            return d.get("content", {}).get("valueString")
    return None


def tooltip_form(defn: str) -> str:
    # IG Publisher dropper siste punktum og legger til constraint-suffiks i hover-tooltip
    base = defn[:-1] if defn.endswith(".") else defn
    return base + " (this element must be supported)"


def translated_by_replacement(mod, replacements, value: str) -> bool:
    return not is_no(mod.apply_replacements(value, replacements))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Sjekker at norsk artefakttekst har engelsk erstatning."
    )
    parser.add_argument(
        "--ig-root",
        type=Path,
        default=ROOT / "LMDI",
        help="Rotkatalogen for IG-en. Standard: LMDI",
    )
    parser.add_argument(
        "--resources-dir",
        type=Path,
        default=None,
        help="Overstyr katalog med genererte FHIR-ressurser.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    resources_dir = args.resources_dir or args.ig_root / "fsh-generated" / "resources"
    if not resources_dir.exists():
        raise SystemExit(f"Fant ikke {resources_dir} — kjør SUSHI/IG Publisher først.")
    mod = load_doklag()
    reps = mod.load_replacements(resources_dir)

    missing = []
    wont_apply = []

    for f in sorted(resources_dir.glob("*.json")):
        try:
            p = json.loads(f.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            continue
        rt = p.get("resourceType")

        for fld in ("title", "description"):
            v = p.get(fld)
            if (
                is_no(v)
                and not get_en(mod, p.get("_" + fld))
                and not translated_by_replacement(mod, reps, v)
            ):
                missing.append((f.name, f"(root).{fld}", v))

        if rt == "StructureDefinition":
            for el in p.get("differential", {}).get("element", []):
                eid = el.get("id")
                for fld in ("short", "definition", "comment"):
                    v = el.get(fld)
                    if not is_no(v):
                        continue
                    if (
                        not get_en(mod, el.get("_" + fld))
                        and not translated_by_replacement(mod, reps, v)
                    ):
                        missing.append((f.name, f"{eid}.{fld}", v))
                    elif fld == "definition" and el.get("mustSupport") is True:
                        # IG Publisher rendrer MS-tooltip som "<definition uten siste
                        # punktum> (this element must be supported)".
                        out = mod.apply_replacements(tooltip_form(v), reps)
                        if is_no(out):
                            wont_apply.append((f.name, f"{eid}.{fld}", out))

        if rt == "CodeSystem":
            for c in p.get("concept", []):
                for fld in ("display", "definition"):
                    v = c.get(fld)
                    if (
                        is_no(v)
                        and not get_en(mod, c.get("_" + fld))
                        and not translated_by_replacement(mod, reps, v)
                    ):
                        missing.append((f.name, f"concept[{c.get('code')}].{fld}", v))

    print(f"=== A) MANGLER ANVENDBAR OVERSETTELSE: {len(missing)} felt ===")
    for fn, loc, v in missing:
        print(f"  {fn} | {loc}: {v[:75]}")

    print(f"\n=== B) OVERSATT, MEN MS-TOOLTIP BEHOLDER NORSK: {len(wont_apply)} definition ===")
    for fn, loc, v in wont_apply:
        print(f"  {fn} | {loc}: {v[:90]}")

    print(f"\nTotalt: {len(missing)} mangler, {len(wont_apply)} MS-tooltips anvendes ikke. "
          f"({len(reps)} erstatningspar lastet)")
    return 1 if missing or wont_apply else 0


if __name__ == "__main__":
    raise SystemExit(main())
