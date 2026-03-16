---
name: lmdi-fhir-profiles
description: Oppdatert arbeidsnotat for LMDI FHIR-profiler. Bruk denne når du skal svare på spørsmål om LMDI-profiler, extensions, valuesets, naming systems, eksempler, kardinaliteter, slicing, constraints eller referanser mellom ressurser i LMDI IG.
---

# LMDI FHIR-profiler

Bruk denne skillen for LMDI FHIR Implementation Guide.

## Arbeidsmåte

Denne skillen er self-contained for lesing og oppslag. Alle FSH-kilder finnes som snapshot under `references/` i skill-mappen. Bruk denne kildeprioriteten:

1. `references/sushi-config.yaml` for gjeldende versjon, canonical, dato og dependencies
2. `references/fsh/aliases.fsh` for globale aliases brukt på tvers av profiler
3. `references/fsh/profiles/*.fsh` for profiler, invariants og inline eksempler
4. `references/fsh/extensions/*.fsh` for extensions
5. `references/fsh/valuesets/*.fsh` for valuesets og codesystems
6. `references/fsh/namingsystems/*.fsh` for naming systems

Behandle FSH som normativ kilde. Denne skillen gir oversikt og kontekst, men **les alltid relevant FSH-fil for detaljer om kardinaliteter, constraints, bindings og slicing**. Hvis skillen og FSH motsier hverandre, stol på FSH.

**Snapshot-modell:** `references/`-mappen er en generert snapshot — kun for lesing og oppslag. Oppdatering av snapshoten skjer i kilderepoet via `scripts/sync_references.sh` (vedlikeholdsmodus, ikke del av normal bruk). Distribuert som ZIP brukes skillen utelukkende til lesing.

## Gjeldende IG-metadata

- Canonical: `http://hl7.no/fhir/ig/lmdi`
- IG-id: `hl7.fhir.no.lmdi`
- Versjon: `1.0.8`
- Dato: `2026-03-10`
- Status: `draft`
- Release label: `ci-build`
- FHIR-versjon: `4.0.1`
- Publisher: `Folkehelseinstituttet`
- Dependencies:
  - `hl7.fhir.uv.extensions.r4` `5.2.0`
  - `hl7.fhir.no.basis` `2.2.0`

## Aliases

- `NoBasisPatient` = `http://hl7.no/fhir/StructureDefinition/no-basis-Patient`
- `NoBasisAddress` = `http://hl7.no/fhir/StructureDefinition/no-basis-Address`
- `NoBasisOrganization` = `http://hl7.no/fhir/StructureDefinition/no-basis-Organization`
- `NoBasisSubstance` = `http://hl7.no/fhir/StructureDefinition/no-basis-Substance`
- `$VsLmdiUrbanDistrict` = `urn:oid:2.16.578.1.12.4.1.1.3403`
- `$kommunenummer-alle` = `urn:oid:2.16.578.1.12.4.1.1.3402`
- `$organization-type` = `http://terminology.hl7.org/CodeSystem/organization-type`
- `$ATC` = `http://www.whocc.no/atc`
- `$organisatoriskBetegnelse` = `urn:oid:2.16.578.1.12.4.1.1.8624`
- `$LMDISubstance` = `http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance`
- `$LMDIMedication` = `http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication`

Merk: `NoBasisPractitioner` brukes som parent i `lmdi-Practitioner.fsh`, men er ikke definert som alias i `aliases.fsh`.

## Artefakter

### Profiler

- `lmdi-medicationadministration` `Legemiddeladministrering` basert på `MedicationAdministration`
- `lmdi-medication` `Legemiddel` basert på `Medication`
- `lmdi-patient` `Pasient` basert på `no-basis-Patient`
- `lmdi-encounter` `Episode` basert på `Encounter`
- `lmdi-condition` `Diagnose` basert på `Condition`
- `lmdi-organization` `Organisasjon` basert på `no-basis-Organization`
- `lmdi-practitioner` `Helsepersonell` basert på `no-basis-Practitioner`
- `lmdi-substance` `Virkestoff` basert på `no-basis-Substance`
- `lmdi-medicationrequest` `Legemiddelrekvirering` basert på `MedicationRequest`
- `lmdi-bundle` `LegemiddelregisterBundle` basert på `Bundle`

### Extensions

- `legemiddel-classification`
- `npr-episode-identifier`
- `lmdi-del-av-behandlingsregime`
- `lmdi-klinisk-studie`
- `lmdi-prosentvis-doseendring`

### ValueSets og CodeSystems

- `lmdi-medicationadministrationstatus`
- `legemiddel-koder`
- `atc-valueset`
- `lmdi-address-use`
- `lmdi-address-type`
- `kommunenummer-alle`
- `LokalLegemiddelkatalogValues`
- `LokalLegemiddelkatalogCodeSystem`
- `KommunenummerCodeSystem`

### NamingSystems

- `http://fh.no/fhir/NamingSystem/lokaltVirkemiddel`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelDose`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelPakning`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff`

Merk: `lmrLopenummer` og `fest-varenummer` brukes i profilen og i `LegemiddelKoder`, men har ikke egne NamingSystem-instansfiler.

## Profilregler, extensions og valuesets — mappingtabell

Detaljerte profilregler (kardinaliteter, constraints, bindings, slicing) finnes i FSH-filene. Bruk tabellen under for å finne riktig fil. Alle stier er relative til skill-mappen.

| Artefakt | FSH-fil | Relevante extensions | Relevante valuesets |
|---|---|---|---|
| lmdi-medicationadministration | `references/fsh/profiles/lmdi-MedicationAdministration.fsh` | — | `LegemiddeladministreringStatus` (definert i samme fil) |
| lmdi-medication | `references/fsh/profiles/lmdi-Medication.fsh` | `references/fsh/extensions/lmdi-LegemiddelClassification.fsh` | `references/fsh/valuesets/lmdi-LegemiddelKoderValueSet.fsh`, `references/fsh/valuesets/lmdi-LokalLegemiddelKatalogValues.fsh` |
| lmdi-patient | `references/fsh/profiles/lmdi-Patient.fsh` | — | `references/fsh/valuesets/lmdi-address-valuesets.fsh`, `references/fsh/valuesets/lmdi-kommunenummer-alle.fsh` |
| lmdi-encounter | `references/fsh/profiles/lmdi-Encounter.fsh` | `references/fsh/extensions/lmdi-ext-npr-episode-identifier.fsh` | — |
| lmdi-condition | `references/fsh/profiles/lmdi-Condition.fsh` | — | — |
| lmdi-organization | `references/fsh/profiles/lmdi-Organization.fsh` | — | `references/fsh/valuesets/lmdi-address-valuesets.fsh`, `references/fsh/valuesets/lmdi-kommunenummer-alle.fsh` |
| lmdi-practitioner | `references/fsh/profiles/lmdi-Practitioner.fsh` | — | — |
| lmdi-substance | `references/fsh/profiles/lmdi-Substance.fsh` | — | — |
| lmdi-medicationrequest | `references/fsh/profiles/lmdi-MedicationRequest.fsh` | `references/fsh/extensions/lmdi-ext-del-av-behandlingsregime.fsh`, `references/fsh/extensions/lmdi-ext-klinisk-studie.fsh`, `references/fsh/extensions/lmdi-ext-prosentvis-doseendring.fsh` | — |
| lmdi-bundle | `references/fsh/profiles/LegemiddelregisterBundle.fsh` | — | — |
| legemiddel-classification (ext) | `references/fsh/extensions/lmdi-LegemiddelClassification.fsh` | — | `references/fsh/valuesets/lmdi-ATCValueSet.fsh` |
| npr-episode-identifier (ext) | `references/fsh/extensions/lmdi-ext-npr-episode-identifier.fsh` | — | — |
| lmdi-del-av-behandlingsregime (ext) | `references/fsh/extensions/lmdi-ext-del-av-behandlingsregime.fsh` | — | — |
| lmdi-klinisk-studie (ext) | `references/fsh/extensions/lmdi-ext-klinisk-studie.fsh` | — | — |
| lmdi-prosentvis-doseendring (ext) | `references/fsh/extensions/lmdi-ext-prosentvis-doseendring.fsh` | — | — |
| LegemiddeladministreringStatus (vs) | `references/fsh/profiles/lmdi-MedicationAdministration.fsh` | — | — |
| LegemiddelKoder (vs) | `references/fsh/valuesets/lmdi-LegemiddelKoderValueSet.fsh` | — | — |
| ATCValueSet (vs) | `references/fsh/valuesets/lmdi-ATCValueSet.fsh` | — | — |
| LmdiAddressUse (vs) | `references/fsh/valuesets/lmdi-address-valuesets.fsh` | — | — |
| LmdiAddressType (vs) | `references/fsh/valuesets/lmdi-address-valuesets.fsh` | — | — |
| KommunenummerValueSet (vs) | `references/fsh/valuesets/lmdi-kommunenummer-alle.fsh` | — | — |
| LokalLegemiddelkatalogValues (vs) | `references/fsh/valuesets/lmdi-LokalLegemiddelKatalogValues.fsh` | — | — |

**Arbeidsinstruksjon:**
- Les alltid relevant FSH-fil før du svarer på detaljspørsmål om en artefakt (profil, extension eller valueset)
- FSH er normativ kilde — hvis skillen og FSH motsier hverandre, stol på FSH
- Les extensions og valuesets som er referert fra profilen ved behov
- Alle FSH-filer ligger under `references/fsh/`: `aliases.fsh` i rotmappen, og undermappene `profiles/`, `extensions/`, `valuesets/`, `namingsystems/`

## Viktige identifikatorer og systemer

- FNR: `urn:oid:2.16.578.1.12.4.1.4.1`
- DNR: `urn:oid:2.16.578.1.12.4.1.4.2`
- ENH: `urn:oid:2.16.578.1.12.4.1.4.101`
- RSH: `urn:oid:2.16.578.1.12.4.1.4.102`
- HPR: `urn:oid:2.16.578.1.12.4.1.4.4`
- Kommunekode: `urn:oid:2.16.578.1.12.4.1.1.3402`
- Bydelskode: `urn:oid:2.16.578.1.12.4.1.1.3403`
- Administrasjonsvei OID 7477: `urn:oid:2.16.578.1.12.4.1.1.7477`
- Legemiddelform OID 7448: `urn:oid:2.16.578.1.12.4.1.1.7448`

## Relasjoner mellom ressurser

- `Legemiddeladministrering.subject -> Pasient`
- `Legemiddeladministrering.medication[x] -> Legemiddel`
- `Legemiddeladministrering.context -> Episode`
- `Legemiddeladministrering.request -> Legemiddelrekvirering`
- `Legemiddeladministrering.reasonReference -> Diagnose`
- `Legemiddelrekvirering.subject -> Pasient`
- `Legemiddelrekvirering.medication[x] -> Legemiddel`
- `Legemiddelrekvirering.requester -> Helsepersonell`
- `Legemiddelrekvirering.encounter -> Episode`
- `Legemiddelrekvirering.reasonReference -> Diagnose`
- `Legemiddelrekvirering.priorPrescription -> Legemiddelrekvirering`
- `Legemiddel.ingredient.itemReference -> Virkestoff | Legemiddel`
- `Episode.serviceProvider -> Organisasjon`
- `Organisasjon.partOf -> Organisasjon`
- `Diagnose.subject -> Pasient`

## Eksempler

Alle eksempler er definert inline i profilfilene (ingen separat `examples/`-mappe). Hver profil-FSH-fil inneholder `Instance:`-definisjoner etter profildefinisjonen:

- **lmdi-MedicationAdministration.fsh**: `Administrering-Oral` (oral administrering), `Administrering-Infusjon` (infusjonsadministrering)
- **lmdi-Medication.fsh**: `Legemiddel-Oksykodon-FEST-Virkestoff` (FEST virkestoff-kode), `Legemiddel-Paracetamol-FEST-Merkevare` (FEST merkevare-kode), `Legemiddel-Monoket-FEST-Pakning` (FEST pakningskode), `Legemiddel-Lokalt-Med-Flere-Ingredienser` (lokalt legemiddel med flere ingredienser)
- **lmdi-Patient.fsh**: `Pasient-Uten-Personidentifikator` (uten FNR/DNR), `Pasient-Med-FNR` (med fødselsnummer), `Pasient-Med-DNR` (med D-nummer)
- **lmdi-Encounter.fsh**: `Episode-Sykehus` (spesialisthelsetjenesten), `Episode-Sykehjem` (primærhelsetjenesten)
- **lmdi-Condition.fsh**: `Diagnose-ICD10` (ICD-10-kode), `Diagnose-SNOMED-CT` (SNOMED CT og ICD-10)
- **lmdi-Organization.fsh**: `Organisasjon-Kommune` (kommune), `Organisasjon-Sykehjem` (sykehjem), `Organisasjon-HF` (helseforetak), `Organisasjon-Sykehus` (sykehus), `Organisasjon-Sykehusavdeling` (spesialistavdeling)
- **lmdi-MedicationRequest.fsh**: `Rekvirering-Paracetamol` (enkel rekvirering), `Rekvirering-Kjemoterapi` (kjemoterapi med doseendring, behandlingsregime og klinisk studie)
- **lmdi-Practitioner.fsh**: `Helsepersonell-Med-HPR` (med HPR-nummer), `Helsepersonell-Uten-HPR` (uten HPR-nummer)
- **lmdi-Substance.fsh**: `Virkestoff-Oksykodon` (eksempel på virkestoff)
- **LegemiddelregisterBundle.fsh**: `Bundle-Scenario-Sykehjem-Oksykodon` (transaction-bundle med sykehjemsscenario)

## Svarstil

- Skill mellom normative regler og eksempeldata
- Skill mellom ting som er bundet/fiksert og ting som bare er anbefalt i `short`, `definition` eller `comment`
- Ved tvil om en URL eller generated id som ikke er eksplisitt satt i FSH, verifiser mot genererte artefakter hvis de finnes
- Hvis annen dokumentasjon motsier FSH, stol på FSH
