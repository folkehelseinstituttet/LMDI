# Hjem - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* **Hjem**

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/ImplementationGuide/hl7.fhir.no.lmdi **  | *Version*:1.0.8 **  |
| Draft as of 2026-03-10 | *Computable Name*:Lmdi |

### Legemiddeldata fra institusjon til Legemiddelregisteret (LMDI)

Komplette og oppdaterte helsedata på legemidler er tilgjengelig for analyse og forskning med tanke på å forbedre kvalitet, styring, helseovervåking, beredskap og kunnskapsforvaltning i helsetjenesten

#### Mål

Samle inn legemiddeldata på individnivå fra polikliniske og innlagte pasienter i institusjon til Legemiddelregisteret (LMR). Som et ledd i dette utvikles det en implementasjonsguide (IG) basert på en felles informasjonsmodell og HL7 FHIR (dette dokumentet). Dette skal benyttes for innsending av data fra institusjon til LMR ved hjelp av datadeling (sikret REST API).

Legemiddelregisteret inneholder allerede data om utleverte legemidler fra apotek på individnivå. LMDI-prosjektet fokuserer nå spesifikt på å utvide dette med data om administrerte legemidler fra sykehus og andre institusjoner, noe som vil gi et mer komplett bilde av legemiddelbruk på tvers av hele helsetjenesten. Dette er en viktig utvidelse som vil styrke grunnlaget for bedre pasientsikkerhet, kunnskapsproduksjon og helseovervåking.

Figur: LMDI-prosjektet skal implementere mottak av data om administrerte legemidler.


#### no-basis-avhengigheter

LMDI-profilene bygger på [no-basis](https://hl7.no/fhir/no-basis/) – de norske basisprofilene for FHIR. no-basis tilbyr standardiserte profiler tilpasset norske forhold, blant annet for identifikatorer, adresser og kodeverk.

Følgende LMDI-profiler arver fra no-basis:

* **Helsepersonell** bygger på no-basis-Practitioner (HPR-nummer, norske spesialiteter)
* **Organisasjon** bygger på no-basis-Organization (organisasjonsnummer, RESH-ID)
* **Pasient** bygger på no-basis-Patient (fødselsnummer, D-nummer, norske adresser)
* **Virkestoff** bygger på no-basis-Substance (virkestoff i norsk kontekst)

Dette gir en konsistent håndtering av norske identifikatorer og kodeverk på tvers av helsesektoren. For å bruke LMDI-profilene må no-basis (versjon 2.2.0) være installert som en avhengighet.

#### Versjoner av implementasjonsguiden

| | | |
| :--- | :--- | :--- |
| 1.0.8 | 2026-03-10 | Forbedret FSH-eksempler: fikset valideringsfeil, lagt til manglende felter, nye scenariobaserte Bundle-eksempler (sykehjem, rekvirering, kjemoterapi)Virkestoff tillatt i LegemiddelregisterBundleHarmonisert no-basis-versjon i byggeskriptRettet skrivefeil og fjernet utdaterte kommentarer i profiler |
| 1.0.7 | 2025-09-30 | Fjernet country-feltet fra adresse i Pasient og Organisasjonaddress.type satt til physical i Pasient (kun fysiske adresser)Endret kommune-extension fra propertyInformation til municipalitycode i PasientFjernet citizenship-extension fra PasientEndret bydel-extension fra lmdi-urban-district til no-basis urbanDistrict i Organisasjon |
| 1.0.6 | 2025-09-12 | Helsepersonell, Organisasjon, Pasient og Virkestoff er nå basert på no-basis |
| 1.0.5 | 2025-07-28 | NPR Episode Identifier extension endret til å støtte både string og UUID samtidig. Extension er nå en kompleks struktur med sub-extensions for stringIdentifier og uuidIdentifier.Lagt til LmrLopenummer- og FestVarenummer-slicene på`Legemiddel.code.coding` |
| 1.0.4 | 2025-05-30 | Legemiddel.code kan nå være en SNOMED CT kode.Ny profil Virkestoff som skal brukes for Substance.Ny extension (Must Support) Episode.nprEpisodeIdentifier.Ny C# eksempelkode for autorisering med HelseID. |
| 1.0.3 | 2025-04-11 | Fjernet Legemiddelrekvirering.dosageInstruction.patientInstruction og Legemiddel.text fra profilen.Ny extension: Legemiddel.classification.La til eksempelkode i C# og Powershell |
| 1.0.2 | 2025-04-01 | Nye extensions lagt til i profilen Legemiddelrekvirering: ProsentvisDoseendring, DelAvBehandlingsregime, KliniskStudie |
| 1.0.1 | 2025-02-04 | Endret LegemiddelregisterBundle. Bundle-type ble endret fra Batch til Transaction |
| 1.0.0 | 2025-01-15 | Første offisielle versjon. Klar for uttesting. |



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "hl7.fhir.no.lmdi",
  "language" : "no",
  "url" : "http://hl7.no/fhir/ig/lmdi/ImplementationGuide/hl7.fhir.no.lmdi",
  "version" : "1.0.8",
  "name" : "Lmdi",
  "title" : "Legemiddeldata fra institusjon til Legemiddelregisteret",
  "status" : "draft",
  "date" : "2026-03-10",
  "publisher" : "Folkehelseinstituttet",
  "contact" : [{
    "name" : "Folkehelseinstituttet",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.fhi.no"
    }]
  },
  {
    "name" : "Legemiddelregisteret",
    "telecom" : [{
      "system" : "email",
      "value" : "legemiddelregisteret@fhi.no"
    }]
  }],
  "description" : "Denne implementasjongguiden beskriver hvordan institusjoner skal overføre data om legemiddelbruk i institusjoner til Legemiddelregisteret",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "NO",
      "display" : "Norway"
    }]
  }],
  "packageId" : "hl7.fhir.no.lmdi",
  "license" : "CC-BY-4.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.1.0"
  },
  {
    "id" : "hl7_fhir_uv_extensions_r4",
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.2.0"
  },
  {
    "id" : "hl7_fhir_no_basis",
    "uri" : "http://fhir.org/packages/hl7.fhir.no.basis/ImplementationGuide/hl7.fhir.no.basis",
    "packageId" : "hl7.fhir.no.basis",
    "version" : "2.2.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2024+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-assets"
      },
      {
        "url" : "value",
        "valueString" : "input/assets"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationAdministration/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationRequest/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Medication/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Patient/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Encounter/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Condition/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Organization/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Practitioner/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Substance/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Bundle/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.no/fhir/ig/lmdi/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#0.9.0"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2024+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-assets"
      },
      {
        "url" : "value",
        "valueString" : "input/assets"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationAdministration/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "MedicationRequest/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Medication/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Patient/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Encounter/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Condition/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Organization/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Practitioner/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Substance/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "no-narrative"
      },
      {
        "url" : "value",
        "valueString" : "Bundle/*"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.no/fhir/ig/lmdi/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Administrering-1-Oralt"
      },
      "name" : "Administrering-1-Oralt",
      "description" : "Eksempel på administrering av legemiddel",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Administrering-2-Infusjon"
      },
      "name" : "Administrering-2-Infusjon",
      "description" : "Eksempel på administrering av legemiddel - infusjon",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Administrering-Contained-Oksykodon-Oral"
      },
      "name" : "Administrering-Contained-Oksykodon-Oral",
      "description" : "Contained eksempel med oral administrering av oksykodon og tilhørende pasient-, episode- og organisasjonskontekst.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Administrering-LogiskReferanse-Infusjon"
      },
      "name" : "Administrering-LogiskReferanse-Infusjon",
      "description" : "Eksempel med logisk medikamentreferanse ved infusjon, uten lokal medication-ressurs i meldingen.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Administrering-Minimal-Botox-Intramuskular-Contained"
      },
      "name" : "Administrering-Minimal-Botox-Intramuskular-Contained",
      "description" : "Minimalt contained eksempel med intramuskulær administrering og kun den nødvendige legemiddelreferansen lokalt i ressursen.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/atc-valueset"
      },
      "name" : "ATC Kodesystem ValueSet",
      "description" : "ValueSet som inneholder koder fra WHO ATC (Anatomisk Terapeutisk Kjemisk legemiddelregister)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/Bundle-Contained-Oksykodon-Sykehjem"
      },
      "name" : "Contained bundle med oksykodonadministrering i sykehjem",
      "description" : "Eksempel på transaction-bundle med contained relaterte ressurser for en enkel sykehjemsadministrering.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-del-av-behandlingsregime"
      },
      "name" : "Del av behandlingsregime",
      "description" : "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-condition"
      },
      "name" : "Diagnose",
      "description" : "Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/Diagnose-1-ICD10-OID"
      },
      "name" : "Diagnose-1-ICD10-OID",
      "description" : "Eksempel på diagnose ICD-10",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/Diagnose-2-SNOMED-CT"
      },
      "name" : "Diagnose-2-SNOMED-CT",
      "description" : "Eksempel på diagnose SNOMED CT og ICD-10",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Endose-Smertebehandling-Administrering"
      },
      "name" : "Endose-Smertebehandling-Administrering",
      "description" : "Subkutan administrering med både SNOMED- og OID7477-koding av administrasjonsvei.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/Endose-Smertebehandling-Diagnose"
      },
      "name" : "Endose-Smertebehandling-Diagnose",
      "description" : "Postoperativ smerte kodet med både ICD-10 og SNOMED CT.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Encounter"
      }],
      "reference" : {
        "reference" : "Encounter/Endose-Smertebehandling-Episode"
      },
      "name" : "Endose-Smertebehandling-Episode",
      "description" : "Sykehusinnleggelse for pasient med akutt smertebehov.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Endose-Smertebehandling-Morfin-Endose"
      },
      "name" : "Endose-Smertebehandling-Morfin-Endose",
      "description" : "Morfin identifisert med både LMR-løpenummer og varenummer.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
      },
      "name" : "Endose-Smertebehandling-Pasient-Dnr",
      "description" : "Pasient med D-nummer i et innleggelsesscenario for postoperativ smertebehandling.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/Endose-Smertebehandling-Rekvirent"
      },
      "name" : "Endose-Smertebehandling-Rekvirent",
      "description" : "Rekvirerende lege i sykehusscenarioet.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/Endose-Smertebehandling-Rekvirering"
      },
      "name" : "Endose-Smertebehandling-Rekvirering",
      "description" : "Rekvirering av morfin ved postoperativ smerte.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Endose-Smertebehandling-Sykehus"
      },
      "name" : "Endose-Smertebehandling-Sykehus",
      "description" : "Sykehusorganisasjon der behandling og administrering skjer.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/Endose-Smertebehandling-Bundle"
      },
      "name" : "Endosebasert smertebehandling med rekvirering, diagnose og administrering",
      "description" : "Komplett bundle for postoperativ smertebehandling der legemidlet er identifisert med LMR-løpenummer og varenummer.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-encounter"
      },
      "name" : "Episode",
      "description" : "Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Encounter"
      }],
      "reference" : {
        "reference" : "Encounter/Episode-1-Sykehus"
      },
      "name" : "Episode-1-Sykehus",
      "description" : "Eksempel på episode i spesialisthelsetjenesten",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/Kjemoterapi-Full-Bundle"
      },
      "name" : "Fullt kjemoterapiscenario med lokal katalog, forrige rekvirering og aktiv administrering",
      "description" : "Komplett bundle som viser lokal legemiddelkatalog, diagnosekobling, begge NPR-identifikatorer og alle LMDI-extensions for rekvirering.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/legemiddel-koder"
      },
      "name" : "Gyldige legemiddelkoder",
      "description" : "ValueSet som inneholder koder fra SNOMED CT, FEST, LMR-nummer, varenummer og lokal legemiddelkatalog",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-practitioner"
      },
      "name" : "Helsepersonell",
      "description" : "Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/Helsepersonell-1-HPR-nummer"
      },
      "name" : "Helsepersonell-1-HPR-nummer",
      "description" : "Eksempel på helsepersonell med HPR-nummer",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/Helsepersonell-2-Uten-HPR"
      },
      "name" : "Helsepersonell-2-Uten-HPR",
      "description" : "Eksempel på rekvirent uten HPR-nummer",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Kjemoterapi-Full-Administrering"
      },
      "name" : "Kjemoterapi-Full-Administrering",
      "description" : "Infusjon av lokalregistrert oksaliplatin med request-, diagnose- og hastighetsinformasjon.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Condition"
      }],
      "reference" : {
        "reference" : "Condition/Kjemoterapi-Full-Diagnose"
      },
      "name" : "Kjemoterapi-Full-Diagnose",
      "description" : "Diagnose knyttet til kjemoterapiregimet.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Encounter"
      }],
      "reference" : {
        "reference" : "Encounter/Kjemoterapi-Full-Episode"
      },
      "name" : "Kjemoterapi-Full-Episode",
      "description" : "Kjemoterapiepisode med både string- og UUID-basert NPR-identifikator.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/Kjemoterapi-Full-Forrige-Rekvirering"
      },
      "name" : "Kjemoterapi-Full-Forrige-Rekvirering",
      "description" : "Tidligere rekvirering i samme kurforløp.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Practitioner"
      }],
      "reference" : {
        "reference" : "Practitioner/Kjemoterapi-Full-Helsepersonell"
      },
      "name" : "Kjemoterapi-Full-Helsepersonell",
      "description" : "Onkolog som rekvirerer kuren.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
      },
      "name" : "Kjemoterapi-Full-Oksaliplatin-LokalKatalog",
      "description" : "Lokalregistrert oksaliplatin med ingredient-reference og ATC-klassifisering.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Kjemoterapi-Full-Organisasjon"
      },
      "name" : "Kjemoterapi-Full-Organisasjon",
      "description" : "Onkologisk avdeling som gjennomfører kjemoterapien.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/Kjemoterapi-Full-Pasient"
      },
      "name" : "Kjemoterapi-Full-Pasient",
      "description" : "Kreftpasient med fullere demografisk og geografisk kontekst.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/Kjemoterapi-Full-Rekvirering"
      },
      "name" : "Kjemoterapi-Full-Rekvirering",
      "description" : "Aktiv rekvirering i FOLFOX6-regime med alle LMDI-extensions.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Substance"
      }],
      "reference" : {
        "reference" : "Substance/Kjemoterapi-Full-Virkestoff"
      },
      "name" : "Kjemoterapi-Full-Virkestoff",
      "description" : "Virkestoff for lokalregistrert oksaliplatin.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-klinisk-studie"
      },
      "name" : "Klinisk studie",
      "description" : "Angir om legemidlet gis som en del av en klinisk studie.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/kommunenummer-codesystem"
      },
      "name" : "Kommunenummer CodeSystem",
      "description" : "Kodesystem for norske kommunenummer (Volven 3402)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/kommunenummer-alle"
      },
      "name" : "Kommunenummer ValueSet",
      "description" : "Komplett kodeverk for norske kommunenummer (Volven 3402)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-medication"
      },
      "name" : "Legemiddel",
      "description" : "Beskrivelse av legemiddel.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/legemiddel-classification"
      },
      "name" : "Legemiddel Classification",
      "description" : "Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Legemiddel-LokalKatalog-Kalsiumklorid-Infusjon"
      },
      "name" : "Legemiddel-LokalKatalog-Kalsiumklorid-Infusjon",
      "description" : "Eksempel på lokalt registrert legemiddel med ingredient som CodeableConcept.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-medicationadministration"
      },
      "name" : "Legemiddeladministrering",
      "description" : "Beskriver administrering av legemiddel til pasient på institusjon.\n\nDette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering og dose med eventuell administrasjonsvei.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-bundle"
      },
      "name" : "LegemiddelregisterBundle",
      "description" : "Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-medicationrequest"
      },
      "name" : "Legemiddelrekvirering",
      "description" : "Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/lmdi-address-type"
      },
      "name" : "LMDI Address Type",
      "description" : "Tillatt verdi for address.type i LMDI: physical",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/lmdi-address-use"
      },
      "name" : "LMDI Address Use",
      "description" : "Tillatte verdier for address.use i LMDI: home, temp, old",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      }],
      "reference" : {
        "reference" : "NamingSystem/lmdi-lokaltLegemiddel"
      },
      "name" : "lmdi-lokaltLegemiddel",
      "description" : "Id for angivelse av legemiddel fra lokal legemiddelkatalog",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/LokalLegemiddelkatalogCodeSystem"
      },
      "name" : "Lokal Legemiddelkatalog Codes",
      "description" : "Kodesystem for lokal legemiddelkatalog",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/LokalLegemiddelkatalogValues"
      },
      "name" : "Lokal Legemiddelkatalog Values",
      "description" : "Gyldige verdier for lokal legemiddelkatalog",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medisin-1-LegemiddelDose-Oxycodone"
      },
      "name" : "Medisin-1-LegemiddelDose-Oxycodone",
      "description" : "Eksempel på legemiddel",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medisin-2-Paracetamol"
      },
      "name" : "Medisin-2-Paracetamol",
      "description" : "Eksempel på legemiddel - Paracetamol",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Medisin-3-LegemiddelPakning-Monoket"
      },
      "name" : "Medisin-3-LegemiddelPakning-Monoket",
      "description" : "Eksempel på legemiddel - paking",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Bundle"
      }],
      "reference" : {
        "reference" : "Bundle/Sykehjem-Minimum-Bundle"
      },
      "name" : "Minimumsrapportering fra sykehjem med to administreringer",
      "description" : "Transaction-bundle med kun nødvendige felter, organisasjonshierarki og to ulike legemiddelslicer.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      }],
      "reference" : {
        "reference" : "NamingSystem/no-basis-fest-legemiddeldose"
      },
      "name" : "no-basis-fest-legemiddeldose",
      "description" : "FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      }],
      "reference" : {
        "reference" : "NamingSystem/no-basis-fest-legemiddelmerkevare"
      },
      "name" : "no-basis-fest-legemiddelmerkevare",
      "description" : "FEST-id for legemiddel merkevare. Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      }],
      "reference" : {
        "reference" : "NamingSystem/no-basis-fest-legemiddelpakning"
      },
      "name" : "no-basis-fest-legemiddelpakning",
      "description" : "FEST-id for legemiddelpakninger. Rekvirering av en bestemt pakning av en merkevare (varenummer)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "NamingSystem"
      }],
      "reference" : {
        "reference" : "NamingSystem/no-basis-fest-legemiddelvirkestoff"
      },
      "name" : "no-basis-fest-legemiddelvirkestoff",
      "description" : "FEST-id for virkestoff. Benyttes ved virkestoffrekvirering",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/npr-episode-identifier"
      },
      "name" : "NPR Episode Identifier",
      "description" : "Entydig identifikator for episode, brukt ved rapportering til NPR. Kan inneholde både string-basert og UUID-basert identifikator.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-organization"
      },
      "name" : "Organisasjon",
      "description" : "Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization.\n\nDenne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post). For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen.\n\nDet er ønskelig at minimum følgende inngår i \"organisasjonshierarkiet\":\n- organisasjonen på lavest mulig nivå (dvs. post, enhet, avdeling eller lignende)\n- organisasjonen på høyre nivå\n     - sykehus, Helseforetak og Regionalt Helseforetak\n     - sykehjem, kommune\n- minst ett organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH)",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Organisasjon-1-Sykehjem"
      },
      "name" : "Organisasjon-1-Sykehjem",
      "description" : "Eksempel på sykehjem i primærhelsetjenesten",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Organisasjon-2-Avdeling"
      },
      "name" : "Organisasjon-2-Avdeling",
      "description" : "Eksempel på spesialistavdeling",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Organisasjon-3-Sykehus"
      },
      "name" : "Organisasjon-3-Sykehus",
      "description" : "Eksempel på sykehusorganisasjon",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-patient"
      },
      "name" : "Pasient",
      "description" : "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/Pasient-1-Uten-FNR"
      },
      "name" : "Pasient-1-Uten-FNR",
      "description" : "Eksempel på pasient med kjønn og fødselsdato",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/Pasient-2-FNR"
      },
      "name" : "Pasient-2-FNR",
      "description" : "Eksempel på pasient med fødselsnummer",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-prosentvis-doseendring"
      },
      "name" : "Prosentvis doseendring",
      "description" : "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/Rekvirering-1"
      },
      "name" : "Rekvirering-1",
      "description" : "Eksempel på legemiddelrekvirering av Paracet",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationRequest"
      }],
      "reference" : {
        "reference" : "MedicationRequest/Rekvirering-2-Kjemoterapi"
      },
      "name" : "Rekvirering-2-Kjemoterapi",
      "description" : "Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/lmdi-medicationadministrationstatus"
      },
      "name" : "Status for legemiddeladministrering",
      "description" : "Verdisett som begrenses status til Legemiddeladministrering til henholdsvis 'Gjennomført' eller 'Feilregistrert'.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Sykehjem-Minimum-Administrering-Oksykodon"
      },
      "name" : "Sykehjem-Minimum-Administrering-Oksykodon",
      "description" : "Minimumsscenario - administrering av oksykodon som virkestoffidentifisert legemiddel.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "MedicationAdministration"
      }],
      "reference" : {
        "reference" : "MedicationAdministration/Sykehjem-Minimum-Administrering-Paracetamol"
      },
      "name" : "Sykehjem-Minimum-Administrering-Paracetamol",
      "description" : "Minimumsscenario - tablettadministrering uten valgfri kontekst utover episode.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Sykehjem-Minimum-Avdeling"
      },
      "name" : "Sykehjem-Minimum-Avdeling",
      "description" : "Minimumsscenario - avdelingen som administrerer legemidlet.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Encounter"
      }],
      "reference" : {
        "reference" : "Encounter/Sykehjem-Minimum-Episode"
      },
      "name" : "Sykehjem-Minimum-Episode",
      "description" : "Minimumsscenario - pågående sykehjemsopphold.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Sykehjem-Minimum-Kommune"
      },
      "name" : "Sykehjem-Minimum-Kommune",
      "description" : "Minimumsscenario - overordnet kommuneorganisasjon.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Sykehjem-Minimum-Oksykodon-Virkestoff"
      },
      "name" : "Sykehjem-Minimum-Oksykodon-Virkestoff",
      "description" : "Minimumsscenario - oksykodon identifisert med FEST virkestoff-id.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Medication"
      }],
      "reference" : {
        "reference" : "Medication/Sykehjem-Minimum-Paracetamol-Merkevare"
      },
      "name" : "Sykehjem-Minimum-Paracetamol-Merkevare",
      "description" : "Minimumsscenario - paracetamol identifisert med FEST merkevare.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/Sykehjem-Minimum-Pasient"
      },
      "name" : "Sykehjem-Minimum-Pasient",
      "description" : "Minimumsscenario - pasient identifisert med fødselsnummer.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Organization"
      }],
      "reference" : {
        "reference" : "Organization/Sykehjem-Minimum-Sykehjem"
      },
      "name" : "Sykehjem-Minimum-Sykehjem",
      "description" : "Minimumsscenario - institusjonen som avdelingen tilhører.",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/lmdi-substance"
      },
      "name" : "Virkestoff",
      "description" : "En tilpasset profil av Substance for å representere virkestoff, basert på no-basis.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Substance"
      }],
      "reference" : {
        "reference" : "Substance/Virkestoff-1-Oksykodon"
      },
      "name" : "Virkestoff-1-Oksykodon",
      "description" : "Eksempel på virkestoff - Oksykodon",
      "exampleCanonical" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance"
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Hjem",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "informasjonsmodell.html"
        }],
        "nameUrl" : "informasjonsmodell.html",
        "title" : "Informasjonsmodell",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "integrasjon.html"
        }],
        "nameUrl" : "integrasjon.html",
        "title" : "Integrasjon",
        "generation" : "markdown",
        "page" : [{
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "SignertKryptertBundle.html"
          }],
          "nameUrl" : "SignertKryptertBundle.html",
          "title" : "SignertKryptertBundle",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "protokoll.html"
          }],
          "nameUrl" : "protokoll.html",
          "title" : "Protokoll",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "eksempelkode_cs.html"
          }],
          "nameUrl" : "eksempelkode_cs.html",
          "title" : "C# eksempelkode",
          "generation" : "markdown"
        },
        {
          "extension" : [{
            "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
            "valueUrl" : "eksempelkode_ps1.html"
          }],
          "nameUrl" : "eksempelkode_ps1.html",
          "title" : "Powershell eksempelkode",
          "generation" : "markdown"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "nedlastinger.html"
        }],
        "nameUrl" : "nedlastinger.html",
        "title" : "Nedlastinger",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "profiler.html"
        }],
        "nameUrl" : "profiler.html",
        "title" : "FHIR-profiler",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "generate-json",
      "value" : "true"
    },
    {
      "code" : "generate-xml",
      "value" : "false"
    },
    {
      "code" : "generate-turtle",
      "value" : "false"
    },
    {
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
