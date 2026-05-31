#!/usr/bin/env python3
from __future__ import annotations

import argparse
import html
import json
import re
import shutil
from dataclasses import dataclass
from html.parser import HTMLParser
from pathlib import Path


EXTERNAL_SCHEMES = ("http://", "https://", "//", "mailto:", "tel:", "data:", "javascript:")

TRANSLATION_EXT_URL = "http://hl7.org/fhir/StructureDefinition/translation"
MUST_SUPPORT_TOOLTIP_SUFFIX = " (this element must be supported)"

SUPPLEMENTAL_REPLACEMENT_PAIRS = (
    (
        "Bundle kan bare inneholde følgende profilerte ressurstyper: Diagnose, Helsepersonell, Episode, Legemiddel, LegemiddelAdministrasjon, Legemiddelrekvirering, Organisasjon, Pasient, Virkestoff",
        "Bundle may only contain the following profiled resource types: Diagnosis, Healthcare professional, Episode, Medication, Medication Administration, Medication Request, Organization, Patient, Substance",
    ),
    (
        "Legemiddeldata fra institusjon til Legemiddelregisteret",
        "Medication data from institutions to Legemiddelregisteret",
    ),
    (
        "Denne implementasjongguiden beskriver hvordan institusjoner skal overføre data om legemiddelbruk i institusjoner til Legemiddelregisteret",
        "This implementation guide describes how institutions shall transfer data on medication use in institutions to Legemiddelregisteret",
    ),
    (
        "Minst én NPR episode identifikator (string eller UUID) må oppgis",
        "At least one NPR episode identifier (string or UUID) must be provided",
    ),
    (
        "Må inneholde tidspunkt for administrering.",
        "Must contain the time of administration.",
    ),
    (
        "Organisasjon skal ha minst ENH eller RSH identifier",
        "Organization shall have at least an ENH or RSH identifier",
    ),
    (
        "Medication skal ha code.coding eller ingredient",
        "Medication shall have code.coding or ingredient",
    ),
    (
        "Id for angivelse av legemiddel fra lokal legemiddelkatalog",
        "ID for specifying medication from a local medication catalog",
    ),
    (
        "FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett.",
        "FEST ID for dose. Prescription of a specific brand with an ID (LMR number) representing the smallest selectable unit, e.g. 1 ampoule or 1 tablet.",
    ),
    (
        "FEST-id for legemiddel merkevare. Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare.",
        "FEST ID for medication brand. Prescription of a strength and form of a specific brand. As of 2024, prescribing by LegemiddelMerkevare is no longer recommended.",
    ),
    (
        "FEST-id for legemiddelpakninger. Rekvirering av en bestemt pakning av en merkevare (varenummer)",
        "FEST ID for medication packages. Prescription of a specific package of a brand (item number)",
    ),
    (
        "FEST-id for virkestoff. Benyttes ved virkestoffrekvirering",
        "FEST ID for active substance. Used for active substance prescribing",
    ),
    (
        "Kilde for URI: https://build.fhir.org/ig/HL7/UTG/CodeSystem-ICD11MMS.html",
        "Source for URI: https://build.fhir.org/ig/HL7/UTG/CodeSystem-ICD11MMS.html",
    ),
    (
        "Identifikator fra FEST",
        "Identifier from FEST",
    ),
    (
        "Komplett kodeverk for norske kommunenummer (Volven 3402)",
        "Complete code system for Norwegian municipality numbers (Volven 3402).",
    ),
    (
        "Kodesystem for norske kommunenummer (Volven 3402)",
        "Code system for Norwegian municipality numbers (Volven 3402).",
    ),
    (
        "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient",
        "The patient who has been prescribed or administered medication, based on no-basis-Patient.",
    ),
    (
        "Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig.",
        "The healthcare professional who prescribed the medication, based on no-basis-Practitioner. HPR number shall be provided when available.",
    ),
    (
        "Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization.",
        "Organizations in the Norwegian health and care service, such as ward, department, clinic, hospital and nursing home. Based on no-basis-Organization.",
    ),
    (
        "En tilpasset profil av Substance for å representere virkestoff, basert på no-basis-Substance.",
        "A tailored Substance profile for representing active substances, based on no-basis-Substance.",
    ),
    (
        "Verdisett som begrenses status til Legemiddeladministrering til henholdsvis 'Gjennomført' eller 'Feilregistrert'.",
        "Value set that restricts the status of medication administration to 'completed' or 'entered-in-error'.",
    ),
    (
        "Verdisett som begrenses status til Medication Administration til henholdsvis ‘Gjennomført’ eller ‘Feilregistrert’.",
        "Value set that restricts the status of medication administration to 'completed' or 'entered-in-error'.",
    ),
    (
        "ATC kode fra WHO ATC kodesystem",
        "ATC code from the WHO ATC code system",
    ),
    (
        "Metavisionkatalog fra Helse Sør-Øst",
        "MetaVision catalogue from South-Eastern Norway Regional Health Authority",
    ),
    (
        "Metavisionkatalog fra Helse Nord",
        "MetaVision catalogue from Northern Norway Regional Health Authority",
    ),
    (
        "Tillatte verdier er home, temp eller old",
        "Allowed values are home, temp, or old",
    ),
    (
        "Adressetype begrenset til home, temp eller old",
        "Address type limited to home, temp, or old",
    ),
    # Status-display fra medication-admin-status. Finnes ellers bare inni den lange
    # ValueSet-description-strengen; trengs frittstaende for concept-tabellen.
    ("Gjennomført", "Completed"),
    ("Feilregistrert", "Entered in Error"),
    # Eksempel-beskrivelser fra Instance `Description:` (havner i ImplementationGuide
    # sin resource.description). Disse kan ikke fa en translation-extension i FSH, sa
    # de oversettes her. Norsk kilde ma matche IG-json ordrett.
    (
        "Eksempel på Helseforetak (Helse Møre og Romsdal HF)",
        "Example of a health trust (Helse Møre og Romsdal HF)",
    ),
    ("Eksempel på Helseforetak", "Example of a health trust"),
    (
        "Eksempel på administrering av cellegift (Cisplatin) basert på rekvirering med prosentvis doseendring",
        "Example of chemotherapy administration (Cisplatin) based on a request with percentage dose adjustment",
    ),
    (
        "Eksempel på administrering av legemiddel - infusjon",
        "Example of medication administration - infusion",
    ),
    (
        "Eksempel på administrering av legemiddel med ICD-10-diagnose som indikasjon",
        "Example of medication administration with an ICD-10 diagnosis as indication",
    ),
    (
        "Eksempel på administrering av legemiddel med SNOMED CT-diagnose som indikasjon",
        "Example of medication administration with a SNOMED CT diagnosis as indication",
    ),
    (
        "Eksempel på administrering av legemiddel med status feilregistrert (entered-in-error)",
        "Example of medication administration with status entered-in-error",
    ),
    ("Eksempel på administrering av legemiddel", "Example of medication administration"),
    ("Eksempel på diagnose ICD-10", "Example of an ICD-10 diagnosis"),
    ("Eksempel på diagnose SNOMED CT", "Example of a SNOMED CT diagnosis"),
    (
        "Eksempel på diagnose med ICD-10-kode J30 - allergisk rhinitt",
        "Example of a diagnosis with ICD-10 code J30 - allergic rhinitis",
    ),
    (
        "Eksempel på episode i spesialisthelsetjenesten med post som tjenesteyter",
        "Example of an episode in the specialist health service with a ward as service provider",
    ),
    (
        "Eksempel på episode i spesialisthelsetjenesten",
        "Example of an episode in the specialist health service",
    ),
    ("Eksempel på episode på sykehjem", "Example of an episode at a nursing home"),
    (
        "Eksempel på helsepersonell med HPR-nummer",
        "Example of a healthcare professional with an HPR number",
    ),
    (
        "Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie",
        "Example of a chemotherapy request with dose adjustment, treatment regimen and clinical trial",
    ),
    (
        "Eksempel på kommune i primærhelsetjenesten",
        "Example of a municipality in primary health care",
    ),
    (
        "Eksempel på legemiddel (SmofKabiven) identifisert med FEST legemiddeldose-id",
        "Example of a medication (SmofKabiven) identified by a FEST medication dose id",
    ),
    (
        "Eksempel på legemiddel (cetirizin) identifisert med FEST legemiddelvirkestoff-id",
        "Example of a medication (cetirizine) identified by a FEST medication substance id",
    ),
    (
        "Eksempel på legemiddel identifisert med FEST legemiddeldose-id",
        "Example of a medication identified by a FEST medication dose id",
    ),
    (
        "Eksempel på legemiddel identifisert med FEST legemiddelmerkevare-id",
        "Example of a medication identified by a FEST medication brand id",
    ),
    (
        "Eksempel på legemiddel identifisert med FEST legemiddelpakning-id",
        "Example of a medication identified by a FEST medication package id",
    ),
    (
        "Eksempel på legemiddel identifisert med FEST legemiddelvirkestoff-id",
        "Example of a medication identified by a FEST medication substance id",
    ),
    (
        "Eksempel på legemiddel identifisert med LMR-løpenummer",
        "Example of a medication identified by an LMR sequence number",
    ),
    (
        "Eksempel på legemiddel identifisert med SNOMED CT-kode",
        "Example of a medication identified by a SNOMED CT code",
    ),
    (
        "Eksempel på legemiddel identifisert med varenummer",
        "Example of a medication identified by an item number",
    ),
    (
        "Eksempel på legemiddel uten code — ingredienser uttrykt via Reference og CodeableConcept",
        "Example of a medication without code — ingredients expressed via Reference and CodeableConcept",
    ),
    ("Eksempel på legemiddelrekvirering av Paracet", "Example of a medication request for Paracet"),
    (
        "Eksempel på lokalt katalogisert cellegift (Cisplatin)",
        "Example of locally catalogued chemotherapy (Cisplatin)",
    ),
    (
        "Eksempel på lokalt legemiddel med flere ingredienser",
        "Example of a local medication with multiple ingredients",
    ),
    ("Eksempel på pasient med D-nummer", "Example of a patient with a D number"),
    (
        "Eksempel på pasient med fødselsnummer",
        "Example of a patient with a national identity number",
    ),
    (
        "Eksempel på pasient uten personidentifikator",
        "Example of a patient without a personal identifier",
    ),
    (
        "Eksempel på post – laveste nivå i organisasjonshierarkiet",
        "Example of a ward – the lowest level in the organizational hierarchy",
    ),
    ("Eksempel på rekvirent uten HPR-nummer", "Example of a requester without an HPR number"),
    (
        "Eksempel på rekvirering av cellegift (Cisplatin) med prosentvis doseendring og del av behandlingsregime",
        "Example of a request for chemotherapy (Cisplatin) with percentage dose adjustment and part of a treatment regimen",
    ),
    (
        "Eksempel på rekvirering for intravenøs infusjon",
        "Example of a request for intravenous infusion",
    ),
    (
        "Eksempel på rekvirering markert som entered-in-error grunnet duplisert behandling",
        "Example of a request marked as entered-in-error due to duplicate treatment",
    ),
    (
        "Eksempel på rekvirering med ICD-10-diagnose som indikasjon (allergisk rhinitt, sesongbehandling)",
        "Example of a request with an ICD-10 diagnosis as indication (allergic rhinitis, seasonal treatment)",
    ),
    (
        "Eksempel på seksjonsnivå i organisasjonshierarkiet",
        "Example of a section level in the organizational hierarchy",
    ),
    (
        "Eksempel på selvadministrering — pasienten tar legemidlet selv etter utdeling fra institusjon",
        "Example of self-administration — the patient takes the medication themselves after dispensing from the institution",
    ),
    ("Eksempel på spesialistavdeling", "Example of a specialist department"),
    (
        "Eksempel på sykehjem i primærhelsetjenesten",
        "Example of a nursing home in primary health care",
    ),
    (
        "Eksempel på sykehusorganisasjon under Helse Møre og Romsdal HF",
        "Example of a hospital organization under Helse Møre og Romsdal HF",
    ),
    ("Eksempel på sykehusorganisasjon", "Example of a hospital organization"),
    (
        "Eksempel på transaction-bundle der medlemsressursene er lokale bundle-instanser merket som inline.",
        "Example of a transaction bundle where the member resources are local bundle instances marked as inline.",
    ),
    ("Eksempel på virkestoff - Oksykodon", "Example of a substance - Oxycodone"),
    # Bundle-eksempelets Title: (resource.name i ImplementationGuide), ikke en Description.
    (
        "Oksykodonadministrering i sykehjem med inline ressurskopier",
        "Oxycodone administration in a nursing home with inline resource copies",
    ),
)


@dataclass(frozen=True)
class MirrorPage:
    source: Path
    target: Path
    source_is_english: bool


def _looks_like_profile_identifier(value: str) -> bool:
    # FHIR-profilnavn brukes som ren tekst i HTML (lenker, breadcrumbs, tabeller) og
    # skal beholde sin identitet pa engelsk. Heuristikk: ingen mellomrom, og enten
    # bindestrekseparert (Pasient-Med-FNR) eller CamelCase med minst ett indre
    # case-skifte (LegemiddelregisterBundle). En-ords navn som "Pasient" eller
    # "Legemiddel" filtreres ikke ut, siden de ogsa brukes i fri prosa.
    if not value or " " in value:
        return False
    if "-" in value and not value.startswith("-"):
        return True
    return any(ch.isupper() for ch in value[1:])


@dataclass(frozen=True)
class Replacement:
    """Ett oversettelsespar med ordgrense-bevisst regex slik at f.eks.
    'Organisasjon' -> 'Organization' ikke treffer midt i 'Organisasjoner'."""
    source: str
    target: str
    pattern: re.Pattern[str]


def _compile_word_boundary(source: str) -> re.Pattern[str]:
    # Bruk lookarounds som virker uansett om source starter/slutter med ord-tegn
    # eller tegnsetting (\b er ikke trygt for f.eks. '"OID 8624"').
    return re.compile(r"(?<!\w)" + re.escape(source) + r"(?!\w)")


def _without_final_period(value: str) -> str:
    return value[:-1] if value.endswith(".") else value


def _replacement_variants(source: str, target: str) -> list[tuple[str, str]]:
    source_without_period = _without_final_period(source)
    target_without_period = _without_final_period(target)
    variants = [
        (source, target),
        (source_without_period, target_without_period),
        (
            source_without_period + MUST_SUPPORT_TOOLTIP_SUFFIX,
            target_without_period + MUST_SUPPORT_TOOLTIP_SUFFIX,
        ),
    ]

    result: list[tuple[str, str]] = []
    seen: set[tuple[str, str]] = set()
    for candidate_source, candidate_target in variants:
        key = (candidate_source, candidate_target)
        if not candidate_source or candidate_source == candidate_target or key in seen:
            continue
        seen.add(key)
        result.append(key)
    return result


def _add_replacement(
    replacements: list[Replacement],
    seen: set[tuple[str, str]],
    source: str,
    target: str,
) -> None:
    # IG Publisher rendrer tekstfelter trimmet, mens FSH-kilden kan ha ledende/
    # avsluttende mellomrom (f.eks. ^definition som slutter pa ". "). Uten trimming
    # treffer ikke substring-erstatningen den rendrede HTML-en.
    source = source.strip()
    target = target.strip()
    for candidate_source, candidate_target in _replacement_variants(source, target):
        key = (candidate_source, candidate_target)
        if key in seen:
            continue
        seen.add(key)
        replacements.append(
            Replacement(candidate_source, candidate_target, _compile_word_boundary(candidate_source))
        )


def _iter_translation_pairs(node: object) -> list[tuple[str, str]]:
    pairs: list[tuple[str, str]] = []

    if isinstance(node, dict):
        for key, value in node.items():
            if key.startswith("_") and isinstance(value, dict):
                source = node.get(key[1:])
                target = _extract_translation(value)
                if isinstance(source, str) and target:
                    pairs.append((source, target))
            elif key.startswith("_") and isinstance(value, list):
                source_values = node.get(key[1:])
                if isinstance(source_values, list):
                    for source, holder in zip(source_values, value):
                        if isinstance(source, str) and isinstance(holder, dict):
                            target = _extract_translation(holder)
                            if target:
                                pairs.append((source, target))

            pairs.extend(_iter_translation_pairs(value))
    elif isinstance(node, list):
        for item in node:
            pairs.extend(_iter_translation_pairs(item))

    return pairs


def load_replacements(resources_dir: Path) -> list[Replacement]:
    replacements: list[Replacement] = []
    seen: set[tuple[str, str]] = set()

    for source, target in SUPPLEMENTAL_REPLACEMENT_PAIRS:
        _add_replacement(replacements, seen, source, target)

    for json_file in sorted(resources_dir.glob("*.json")):
        try:
            payload = json.loads(json_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            continue

        for source, target in _iter_translation_pairs(payload):
            if not source or not target or source == target:
                continue
            if _looks_like_profile_identifier(source):
                continue
            _add_replacement(replacements, seen, source, target)

    # Lengste source først, slik at lange treff bindes før kortere overlappende strenger
    replacements.sort(key=lambda r: (-len(r.source), r.source, r.target))
    return replacements


def apply_replacements(text: str, replacements: list[Replacement]) -> str:
    for repl in replacements:
        if repl.source in text:
            text = repl.pattern.sub(repl.target, text)
    return text


def _extract_translation(extension_holder: dict | None) -> str | None:
    # Plukker ut engelsk valueString fra et _description/_title-felt med translation-extension
    if not extension_holder:
        return None
    for ext in extension_holder.get("extension", []):
        if ext.get("url") != TRANSLATION_EXT_URL:
            continue
        lang = None
        content = None
        for sub in ext.get("extension", []):
            if sub.get("url") == "lang":
                lang = sub.get("valueCode")
            elif sub.get("url") == "content":
                content = sub.get("valueString")
        if lang == "en" and isinstance(content, str):
            return content
    return None


def load_structure_definition_descriptions(resources_dir: Path) -> dict[str, str]:
    """Returnerer map fra StructureDefinition.id til engelsk description-markdown."""
    result: dict[str, str] = {}
    if not resources_dir.exists():
        return result

    for sd_file in sorted(resources_dir.glob("StructureDefinition-*.json")):
        try:
            payload = json.loads(sd_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError:
            continue

        if payload.get("resourceType") != "StructureDefinition":
            continue
        sd_id = payload.get("id")
        if not isinstance(sd_id, str):
            continue

        english = _extract_translation(payload.get("_description"))
        if english:
            result[sd_id] = english

    return result


def render_description_html(markdown_text: str) -> str:
    """Rendrer enkel markdown fra FSH description-felter uten ekstern avhengighet."""
    lines = [line.strip() for line in markdown_text.splitlines()]
    blocks: list[str] = []
    paragraph: list[str] = []
    bullets: list[str] = []

    def flush_paragraph() -> None:
        if paragraph:
            blocks.append(f"<p>{html.escape(' '.join(paragraph))}</p>")
            paragraph.clear()

    def flush_bullets() -> None:
        if bullets:
            items = "".join(f"<li>{html.escape(item)}</li>" for item in bullets)
            blocks.append(f"<ul>{items}</ul>")
            bullets.clear()

    for line in lines:
        if not line:
            flush_paragraph()
            flush_bullets()
            continue
        if line.startswith("- "):
            flush_paragraph()
            bullets.append(line[2:].strip())
        else:
            flush_bullets()
            paragraph.append(line)

    flush_paragraph()
    flush_bullets()
    return "\n".join(blocks)


# IG Publisher pakker rendret description forskjellig avhengig av SD-type:
#  - Profile (StructureDefinition på et resource): ytre <p>-wrapper, etterfulgt av
#    "<!-- insert intro if present -->"-kommentar.
#  - Extension (StructureDefinition på en extension): ingen ytre wrapper, etterfulgt av
#    "<p><b>Context of Use</b></p>".
DESCRIPTION_BLOCK_PROFILE_RE = re.compile(
    r"(<p>\s*\n)(<p>.+?)(\n</p>\s*\n+\s*<!-- insert intro if present -->)",
    re.DOTALL,
)
DESCRIPTION_BLOCK_EXTENSION_RE = re.compile(
    r"(</table>\s*\n+\s*)(<p>.+?</p>(?:\s*<ul>.*?</ul>)?)(\s*\n+\s*<p><b>Context of Use</b></p>)",
    re.DOTALL,
)


def replace_description_block(html: str, english_html: str) -> str | None:
    """Erstatt rendret norsk description med engelsk HTML. Returnerer ny HTML
    eller None hvis ingen mønstre matchet."""
    for pattern in (DESCRIPTION_BLOCK_PROFILE_RE, DESCRIPTION_BLOCK_EXTENSION_RE):
        def _sub(match: re.Match[str]) -> str:
            return f"{match.group(1)}{english_html}{match.group(3)}"

        new_html, count = pattern.subn(_sub, html, count=1)
        if count:
            return new_html
    return None


# Match StructureDefinition-{id}.html (base-siden, ikke -definitions/-examples/-mappings/-testing
# eller diverse format-suffixer som .profile.json.html).
STRUCTURE_DEFINITION_BASE_RE = re.compile(r"^StructureDefinition-(?P<id>[A-Za-z0-9._-]+)\.html$")


LANG_SWITCHER_RE = re.compile(
    r'(<select id="lang-switcher"[^>]*>)(.*?)(</select>)',
    re.DOTALL,
)


def rewrite_language_switcher(html: str, *, root_href: str) -> str:
    def repl(match: re.Match[str]) -> str:
        start, _body, end = match.groups()
        return (
            f'{start}'
            f'<option value="no" data-href="{root_href}">Norsk</option>'
            f'<option value="en" selected="selected" data-href="">English</option>'
            f'{end}'
        )

    return LANG_SWITCHER_RE.sub(repl, html, count=1)


PROFILE_LINKS = {
    "LegemiddelregisterBundle": "StructureDefinition-lmdi-bundle.html",
    "Patient": "StructureDefinition-lmdi-patient.html",
    "Practitioner": "StructureDefinition-lmdi-practitioner.html",
    "Organization": "StructureDefinition-lmdi-organization.html",
    "Encounter": "StructureDefinition-lmdi-encounter.html",
    "Condition": "StructureDefinition-lmdi-condition.html",
    "Medication": "StructureDefinition-lmdi-medication.html",
    "MedicationAdministration": "StructureDefinition-lmdi-medicationadministration.html",
    "MedicationRequest": "StructureDefinition-lmdi-medicationrequest.html",
    "Substance": "StructureDefinition-lmdi-substance.html",
    "LegemiddelClassification": "StructureDefinition-legemiddel-classification.html",
    "DelAvBehandlingsregime": "StructureDefinition-lmdi-del-av-behandlingsregime.html",
    "KliniskStudie": "StructureDefinition-lmdi-klinisk-studie.html",
    "NprEpisodeIdentifier": "StructureDefinition-npr-episode-identifier.html",
    "ProsentvisDoseendring": "StructureDefinition-lmdi-prosentvis-doseendring.html",
}


def inject_profiler_links(html: str) -> str:
    for label, href in PROFILE_LINKS.items():
        html = re.sub(
            rf"(<tr>\s*<td>){re.escape(label)}(</td>)",
            rf'\1<a href="{href}">{label}</a>\2',
            html,
            count=1,
        )
    return html


def rebased_href(value: str, *, source_is_english: bool, planned_local_names: set[str]) -> str:
    if not value:
        return value

    if value.startswith(EXTERNAL_SCHEMES) or value.startswith(("#", "/", "../", "./")):
        return value

    if source_is_english:
        if value.startswith("en-") and value.endswith(".html"):
            stripped = value[3:]
            if stripped in planned_local_names:
                return stripped

        if value in planned_local_names:
            return value

        return f"../{value}"

    if value.startswith("en-") and value.endswith(".html"):
        stripped = value[3:]
        if stripped in planned_local_names:
            return stripped

    if value.startswith("en/") and value.endswith(".html"):
        stripped = value[3:]
        if stripped in planned_local_names:
            return stripped

    if value in planned_local_names:
        return value

    return f"../{value}"


class MirrorHtmlParser(HTMLParser):
    def __init__(
        self,
        *,
        source_is_english: bool,
        planned_local_names: set[str],
        replacements: list[Replacement],
    ) -> None:
        super().__init__(convert_charrefs=False)
        self.source_is_english = source_is_english
        self.planned_local_names = planned_local_names
        self.replacements = replacements
        self.parts: list[str] = []
        self.raw_text_tag: str | None = None

    def handle_decl(self, decl: str) -> None:
        self.parts.append(f"<!{decl}>")

    def handle_pi(self, data: str) -> None:
        self.parts.append(f"<?{data}>")

    def handle_comment(self, data: str) -> None:
        self.parts.append(f"<!--{data}-->")

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        self.parts.append(self._render_tag(tag, attrs, closing=False, self_closing=False))
        if tag in {"script", "style"}:
            self.raw_text_tag = tag

    def handle_startendtag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        self.parts.append(self._render_tag(tag, attrs, closing=False, self_closing=True))

    def handle_endtag(self, tag: str) -> None:
        self.parts.append(f"</{tag}>")
        if self.raw_text_tag == tag:
            self.raw_text_tag = None

    def handle_data(self, data: str) -> None:
        if self.raw_text_tag in {"script", "style"}:
            self.parts.append(data)
            return
        self.parts.append(apply_replacements(data, self.replacements))

    def handle_entityref(self, name: str) -> None:
        self.parts.append(f"&{name};")

    def handle_charref(self, name: str) -> None:
        self.parts.append(f"&#{name};")

    def _render_tag(
        self,
        tag: str,
        attrs: list[tuple[str, str | None]],
        *,
        closing: bool,
        self_closing: bool,
    ) -> str:
        rendered_attrs: list[str] = []
        for attr, value in attrs:
            if value is None:
                rendered_attrs.append(attr)
                continue

            if attr in {"href", "src"} or (tag == "object" and attr == "data"):
                value = rebased_href(
                    value,
                    source_is_english=self.source_is_english,
                    planned_local_names=self.planned_local_names,
                )
            elif attr == "data-href":
                if self.source_is_english:
                    if value and not value.startswith(EXTERNAL_SCHEMES) and not value.startswith(("#", "/", "../", "./")):
                        value = f"../{value}"
                else:
                    if value.startswith("en-") and value.endswith(".html"):
                        stripped = value[3:]
                        if stripped in self.planned_local_names:
                            value = stripped
                    elif value.startswith("en/") and value.endswith(".html"):
                        stripped = value[3:]
                        if stripped in self.planned_local_names:
                            value = stripped
                    elif value and not value.startswith(EXTERNAL_SCHEMES) and value not in self.planned_local_names:
                        value = f"../{value}"
            else:
                value = apply_replacements(value, self.replacements)

            escaped = (
                value.replace("&", "&amp;")
                .replace('"', "&quot;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
            )
            rendered_attrs.append(f'{attr}="{escaped}"')

        suffix = " /" if self_closing else ""
        attrs_text = f" {' '.join(rendered_attrs)}" if rendered_attrs else ""
        return f"<{tag}{attrs_text}{suffix}>"

    def get_html(self) -> str:
        return "".join(self.parts)


def build_mirror(
    *,
    output_dir: Path,
    replacements: list[Replacement],
    sd_descriptions: dict[str, str],
) -> list[MirrorPage]:
    mirror_dir = output_dir / "en"
    if mirror_dir.exists():
        shutil.rmtree(mirror_dir)
    mirror_dir.mkdir(parents=True, exist_ok=True)

    english_sources = sorted(output_dir.glob("en-*.html"))
    reserved_targets = {item.name[3:] for item in english_sources}

    pages: list[MirrorPage] = []
    for source in english_sources:
        target = mirror_dir / source.name[3:]
        pages.append(MirrorPage(source=source, target=target, source_is_english=True))

    for source in sorted(output_dir.glob("*.html")):
        if source.name.startswith("en-"):
            continue
        if source.name in reserved_targets:
            continue
        target = mirror_dir / source.name
        pages.append(MirrorPage(source=source, target=target, source_is_english=False))

    planned_local_names = {page.target.name for page in pages}

    # Pre-rendre alle engelske description-blokker som HTML én gang
    rendered_descriptions = {
        sd_id: render_description_html(md) for sd_id, md in sd_descriptions.items()
    }

    description_replaced = 0
    for page in pages:
        html = page.source.read_text(encoding="utf-8")

        # Bytt rendret norsk description med engelsk HTML for base-SD-sider FØR resten
        # av prosesseringen, slik at vi unngår at substring-erstatninger forsøker å
        # rote i en allerede engelsk blokk.
        if not page.source_is_english:
            sd_match = STRUCTURE_DEFINITION_BASE_RE.match(page.target.name)
            if sd_match:
                english_html = rendered_descriptions.get(sd_match.group("id"))
                if english_html:
                    replaced = replace_description_block(html, english_html)
                    if replaced is not None:
                        html = replaced
                        description_replaced += 1

        parser = MirrorHtmlParser(
            source_is_english=page.source_is_english,
            planned_local_names=planned_local_names,
            replacements=replacements if not page.source_is_english else [],
        )
        parser.feed(html)
        parser.close()
        html = parser.get_html()
        if not page.source_is_english:
            html = apply_replacements(html, replacements)
        html = html.replace('src="assets/', 'src="../assets/')
        html = html.replace("src='assets/", "src='../assets/")
        html = html.replace('href="assets/', 'href="../assets/')
        html = html.replace("href='assets/", "href='../assets/")
        if page.source_is_english and page.target.name == "profiler.html":
            html = inject_profiler_links(html)
        if not page.source_is_english:
            html = html.replace(
                '<html xml:lang="nb" xmlns="http://www.w3.org/1999/xhtml" lang="nb">',
                '<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml" lang="en">',
                1,
            )
        root_href = f"../{page.target.name}"
        html = rewrite_language_switcher(html, root_href=root_href)
        page.target.parent.mkdir(parents=True, exist_ok=True)
        page.target.write_text(html, encoding="utf-8")

    expected = len(sd_descriptions)
    print(f"Erstattet description-blokk pa {description_replaced} av {expected} StructureDefinition-sider")
    if description_replaced < expected:
        # Mismatch betyr at en SD-side har en HTML-struktur som verken Profile- eller
        # Extension-regex matcher — sannsynligvis ny markup fra IG Publisher.
        print(
            "ADVARSEL: Noen StructureDefinition-sider mangler engelsk description. "
            "Sjekk om DESCRIPTION_BLOCK_*_RE i lag-en-doklag.py trenger ny variant."
        )
    return pages


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Bygg en /en/-speiling av LMDI-output.")
    parser.add_argument(
        "--ig-root",
        default="LMDI",
        help="Sti til IG-roten som inneholder output/ og fsh-generated/.",
    )
    parser.add_argument(
        "--output-dir",
        default=None,
        help="Sti til IG Publisher output-mappen. Default er <ig-root>/output.",
    )
    parser.add_argument(
        "--resources-dir",
        default=None,
        help="Sti til fsh-generated/resources. Default er <ig-root>/fsh-generated/resources.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    ig_root = Path(args.ig_root).resolve()
    output_dir = Path(args.output_dir).resolve() if args.output_dir else ig_root / "output"
    resources_dir = Path(args.resources_dir).resolve() if args.resources_dir else ig_root / "fsh-generated" / "resources"

    if not output_dir.exists():
        raise SystemExit(f"Fant ikke output-mappen: {output_dir}")
    if not resources_dir.exists():
        raise SystemExit(f"Fant ikke FSH-genererte ressurser: {resources_dir}")

    replacements = load_replacements(resources_dir)
    sd_descriptions = load_structure_definition_descriptions(resources_dir)
    mirrored_pages = build_mirror(
        output_dir=output_dir,
        replacements=replacements,
        sd_descriptions=sd_descriptions,
    )

    print(f"Bygget {len(mirrored_pages)} engelske speilsider under {output_dir / 'en'}")
    print(f"Brukte {len(replacements)} oversettelsespar fra {resources_dir}")
    print(f"Lastet engelsk description for {len(sd_descriptions)} StructureDefinitions fra {resources_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
