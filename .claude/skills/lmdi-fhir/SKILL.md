---
name: lmdi-fhir-profiles
description: Oppdatert arbeidsnotat for LMDI FHIR-profiler. Bruk denne når du skal svare på spørsmål om LMDI-profiler, extensions, valuesets, naming systems, eksempler, kardinaliteter, slicing, constraints eller referanser mellom ressurser i LMDI IG.
---

# LMDI FHIR-profiler

Bruk denne skillen for LMDI-repoet (rotmappen i dette repoet).

## Arbeidsmåte

Bruk denne kildeprioriteten:

1. `LMDI/sushi-config.yaml` for gjeldende versjon, canonical, dato og dependencies
2. `LMDI/input/fsh/profiles/*.fsh` for profiler og invariants
3. `LMDI/input/fsh/extensions/*.fsh` for extensions
4. `LMDI/input/fsh/valuesets/*.fsh` for valuesets og codesystems
5. `LMDI/input/fsh/namingsystems/*.fsh` for naming systems
6. `LMDI/input/fsh/examples/*.fsh` for eksempler og scenarier

Behandle FSH som normativ kilde. `README.md`, `CLAUDE.md` og eldre user-skills kan være utdaterte.

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

## Aliases fra repoet

- `NoBasisPatient` = `http://hl7.no/fhir/StructureDefinition/no-basis-Patient`
- `NoBasisAddress` = `http://hl7.no/fhir/StructureDefinition/no-basis-Address`
- `NoBasisOrganization` = `http://hl7.no/fhir/StructureDefinition/no-basis-Organization`
- `NoBasisSubstance` = `http://hl7.no/fhir/StructureDefinition/no-basis-Substance`
- `$VsLmdiUrbanDistrict` = `urn:oid:2.16.578.1.12.4.1.1.3403`
- `$kommunenummer-alle` = `urn:oid:2.16.578.1.12.4.1.1.3402`
- `$organization-type` = `http://terminology.hl7.org/CodeSystem/organization-type`
- `$ATC` = `http://www.whocc.no/atc`
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

### NamingSystems definert i repoet

- `http://fh.no/fhir/NamingSystem/lokaltVirkemiddel`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelDose`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelPakning`
- `http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff`

Merk: `lmrLopenummer` og `fest-varenummer` brukes i profilen og i `LegemiddelKoder`, men har ikke egne NamingSystem-instansfiler i repoet.

## Viktigste profilregler

### Legemiddeladministrering

- `status` er bundet til `LegemiddeladministreringStatus` (kun `completed` | `entered-in-error`)
- `subject` refererer kun til `Pasient`
- `medication[x]` refererer kun til `Legemiddel`
- `effective[x]` er `1..1` og bare `dateTime` eller `Period`
- invariant `time-required` gjelder for `effectiveDateTime`, `effectivePeriod.start` og `effectivePeriod.end`
- `context` er MS og refererer til `Episode`
- `request` er MS og refererer til `Legemiddelrekvirering`
- `reasonReference` refererer til `Diagnose`
- `dosage.route.coding` er `1..*` og lukket slicing på `system` med slices `SCT` og `OID7477`
- `dosage.dose` er `1..1`
- `dosage.rateRatio` er MS
- disse elementene er slått av: `device`, `note`, `partOf`, `performer`, `supportingInformation`, `text`, `eventHistory`, `dosage.text`, `dosage.route.text`

### Legemiddel

- invariant `lmdi-medication-code-or-ingredient`: `code.coding.exists() or ingredient.exists()`
- `code` er extensible bundet til `LegemiddelKoder`
- `code.coding` har åpen slicing på `system`
- støttede `code.coding`-slicer:
  - `FestLegemiddeldose`
  - `FestLmrLopenr`
  - `FestLegemiddelMerkevare`
  - `FestLegemiddelpakning`
  - `Varenummer`
  - `FestVirkestoff`
  - `LokaltLegemiddel`
  - `SCT`
- `LokaltLegemiddel.display` er `1..1`
- `extension` har lukket slicing (`#closed`); kun `extension[classification]` (`0..1`, `LegemiddelClassification`) er tillatt
- `code.text` er `0..0`
- `form.text` er `0..0`
- `form.coding` er lukket slicing med `OID7448` og `SCT`; `form.coding.system` og `form.coding.code` er `1..1`, `form.coding.display` er MS
- `batch` er MS
- `ingredient.item[x]` er bare `Reference` eller `CodeableConcept`
- `ingredient.itemReference` kan bare peke til `lmdi-substance` eller `lmdi-medication`
- `ingredient.itemCodeableConcept` har preferred binding til `LegemiddelKoder`
- `manufacturer` og `text` er slått av

### Pasient

- basert på `no-basis-Patient`
- `address` er MS og kun `NoBasisAddress`
- `address.type` er fast `physical` og bundet til `LmdiAddressType`
- `address.use` er required bundet til `LmdiAddressUse` (`home`, `temp`, `old`)
- `address.district.extension[municipalitycode]` bruker kodeverk `3402`
- `address.extension[urbanDistrict]` bruker kodeverk `3403`
- `address.extension[official]`, `address.extension[propertyInformation]` og `address.country` er `0..0`
- `birthDate` og `gender` er MS
- `identifier[FNR]` og `identifier[DNR]` er støttet (begge har `value 1..1`); `identifier[FHN]` og `identifier[HNR]` er slått av
- `citizenship`, `name`, `telecom`, `managingOrganization`, `maritalStatus`, `photo`, `deceased[x]`, `multipleBirth[x]`, `active`, `communication`, `contact`, `generalPractitioner`, `link` og `text` er slått av

### Episode

- `extension[nprEpisodeIdentifier]` er `0..1` og MS
- `serviceProvider` refererer kun til `Organisasjon`
- store deler av `Encounter` er slått av, blant annet `subject`, `type`, `period`, `reasonCode`, `reasonReference`, `diagnosis`, `location`, `partOf` og `text`

### Diagnose

- `subject` er `1..1` og refererer kun til `Pasient`
- `code` er `1..1`
- `code.coding` er lukket slicing på `system` med `SCT`, `ICD10`, `ICD11`, `ICPC2`
- `stage.summary` er satt til `1..1`
- `encounter`, `text`, `category`, `severity`, `bodySite`, `abatement[x]`, `onset[x]`, `recorder`, `recordedDate`, `asserter`, `evidence`, `note` og `stage.assessment` er slått av

### Organisasjon

- basert på `no-basis-Organization`
- invariant `lmdi-org-identifier`: minst én identifier med system `ENH` eller `RSH`
- `identifier` er MS, med slicene `ENH` og `RSH` fra no-basis
- `name` er `1..1` og MS
- `partOf` er MS og refererer kun til `Organisasjon`
- `address` er MS
- `address.type` er fast `physical` og bundet til `LmdiAddressType`
- `address.district.extension[municipalitycode]` og `address.extension[urbanDistrict]` brukes
- `text`, `active`, `telecom`, `contact`, `endpoint`, `address.text`, `address.line`, `address.city`, `address.postalCode`, `address.country` er slått av

### Helsepersonell

- basert på `no-basis-Practitioner`
- `identifier` bruker lukket slicing, kun `identifier[HPR]` tillatt
- `identifier[HPR]` er `0..1` og MS
- `identifier[FNR]` og `identifier[DNR]` er slått av
- `text`, `name`, `telecom`, `address`, `gender`, `birthDate`, `photo`, `qualification`, `communication`, `active` er slått av

### Virkestoff

- basert på `no-basis-Substance`
- `category` er `1..1`
- `text`, `description` og `ingredient` er slått av

### Legemiddelrekvirering

- `extension[prosentvisDoseendring]`, `extension[delAvBehandlingsregime]` og `extension[kliniskStudie]` støttes
- `identifier`, `status`, `intent`, `medication[x]`, `subject` og `requester` er MS
- `medication[x]` refererer kun til `Legemiddel`
- `subject` refererer kun til `Pasient`
- `requester` refererer kun til `Helsepersonell`
- `reasonReference` refererer kun til `Diagnose`
- `priorPrescription` refererer kun til `Legemiddelrekvirering`
- `encounter` refererer kun til `Episode`
- `reported[x]` er bare `boolean`
- disse elementene er slått av: `text`, `recorder`, `insurance`, `supportingInformation`, `performer`, `performerType`, `basedOn`, `note`, `dispenseRequest`, `detectedIssue`, `eventHistory`, `dosageInstruction.text`, `dosageInstruction.patientInstruction`

### LegemiddelregisterBundle

- `identifier`, `timestamp`, `type`, `entry`, `entry.request`, `entry.request.method` og `entry.resource` er påkrevd/MS som definert i profilen
- `type` er fast `transaction`
- `entry.request.method` er fast `POST`
- invariant `lr-allowed-resources` tillater bare disse profilene:
  - `lmdi-condition`
  - `lmdi-practitioner`
  - `lmdi-encounter`
  - `lmdi-medication`
  - `lmdi-medicationadministration`
  - `lmdi-medicationrequest`
  - `lmdi-organization`
  - `lmdi-patient`
  - `lmdi-substance`
- `total` og `link` er slått av

## Extensions

### LegemiddelClassification

- URL: `http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification`
- Context: `Medication`
- `value[x]` er kun `CodeableConcept`
- `valueCodeableConcept` er `1..1` og MS
- binding: preferred til `http://fhir.no/ValueSet/atc-valueset`

### NprEpisodeIdentifier

- URL: `http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier`
- Context: `Encounter`
- kompleks extension med:
  - `stringIdentifier` `0..1` MS, `valueString 1..1`
  - `uuidIdentifier` `0..1` MS, `valueUuid 1..1`
- invariant `npr-episode-at-least-one`: minst én av subextensions må finnes

### DelAvBehandlingsregime

- URL: `http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime`
- Context: `MedicationRequest`
- `value[x]` er kun `string`

### KliniskStudie

- URL: `http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie`
- Context: `MedicationRequest`
- `value[x]` er kun `boolean`

### ProsentvisDoseendring

- URL: `http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring`
- Context: `MedicationRequest`
- `value[x]` er kun `Quantity`
- `valueQuantity.system` = `http://unitsofmeasure.org`
- `valueQuantity.code` = `%`
- `valueQuantity.unit` = `%`

## ValueSets og kodeverk

- `LegemiddeladministreringStatus`
  - URL: `http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-medicationadministrationstatus`
  - koder fra `http://terminology.hl7.org/CodeSystem/medication-admin-status`
  - tillatte koder: `completed`, `entered-in-error`
- `LegemiddelKoder`
  - URL: `http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder`
  - inkluderer `SNOMED CT`, `festLegemiddelMerkevare`, `festLegemiddelVirkestoff`, `festLegemiddelPakning`, `festLegemiddelDose`, `lmrLopenummer`, `fest-varenummer`, `lokaltVirkemiddel`
- `ATCValueSet`
  - URL: `http://fhir.no/ValueSet/atc-valueset`
  - inkluderer `http://www.whocc.no/atc`
- `LmdiAddressUse`
  - URL: `http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-use`
  - koder: `home`, `temp`, `old`
- `LmdiAddressType`
  - URL: `http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-type`
  - kode: `physical`
- `KommunenummerValueSet`
  - URL: `http://hl7.no/fhir/ig/lmdi/ValueSet/kommunenummer-alle`
  - system: `urn:oid:2.16.578.1.12.4.1.1.3402`
- `LokalLegemiddelkatalogValues`
  - URL: `http://hl7.no/fhir/ig/lmdi/ValueSet/LokalLegemiddelkatalogValues`
  - system: `http://hl7.no/fhir/ig/lmdi/CodeSystem/LokalLegemiddelkatalogCodeSystem`
  - koder:
    - `metavisionkatalogFraHso`
    - `metavisionkatalogFraHN`

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

## Eksempler som finnes i repoet

- `lmdi-example-1.fsh`: inline/contained eksempel
- `lmdi-example-2.fsh`: minimal contained referanse
- `lmdi-example-3-logical.fsh`: identifier-baserte/logiske referanser
- `lmdi-example-LokalLegemiddelKatalog.fsh`: lokalt legemiddel med ingredient
- `lmdi-example-scenario-sykehjem.fsh`: Scenario A, sykehjem med organisasjonshierarki
- `lmdi-example-scenario-rekvirering.fsh`: Scenario B, rekvirering + diagnose + administrering
- `lmdi-example-scenario-kjemoterapi.fsh`: Scenario C, kjemoterapi med alle MedicationRequest-extensions

## Svarstil

- Skill mellom normative regler og eksempeldata
- Skill mellom ting som er bundet/fiksert og ting som bare er anbefalt i `short`, `definition` eller `comment`
- Ved tvil om en URL eller generated id som ikke er eksplisitt satt i FSH, verifiser mot genererte artefakter hvis de finnes
- Hvis repoets dokumentasjon motsier FSH, stol på FSH
