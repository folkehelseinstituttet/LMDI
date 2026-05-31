# LegemiddelregisterBundle - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.1

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **LegemiddelregisterBundle**

## Resource Profile: LegemiddelregisterBundle 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle **  | *Version*:1.1.1 **  |
| Active as of 2026-05-31 | *Computable Name*:LegemiddelregisterBundle |

 
Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. 

**Usages:**

* Examples for this Profile: [Bundle/Bundle-Scenario-Sykehjem-Oksykodon](Bundle-Bundle-Scenario-Sykehjem-Oksykodon.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-bundle.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-bundle.csv), [Excel](StructureDefinition-lmdi-bundle.xlsx), [Schematron](StructureDefinition-lmdi-bundle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-bundle",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle",
  "version" : "1.1.1",
  "name" : "LegemiddelregisterBundle",
  "title" : "LegemiddelregisterBundle",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Legemiddelregisteret Bundle"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "date" : "2026-05-31T19:08:08+00:00",
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
  "description" : "Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Bundle profile for Legemiddelregisteret. Supports only transaction type and POST operations, with restrictions on allowed resource types."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "NO",
      "display" : "Norway"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle",
      "constraint" : [{
        "key" : "lr-allowed-resources",
        "severity" : "error",
        "human" : "Bundle kan bare inneholde følgende profilerte ressurstyper: Diagnose, Helsepersonell, Episode, Legemiddel, LegemiddelAdministrasjon, Legemiddelrekvirering, Organisasjon, Pasient, Virkestoff",
        "expression" : "entry.all(\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient').exists() or\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance').exists()\n)",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"
      }]
    },
    {
      "id" : "Bundle.identifier",
      "path" : "Bundle.identifier",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Bundle.type",
      "path" : "Bundle.type",
      "short" : "Må være av type transaction",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Must be of type transaction"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Angir at bundle må være av type transaction",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Indicates that the bundle must be of type transaction"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "fixedCode" : "transaction",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.timestamp",
      "path" : "Bundle.timestamp",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Bundle.total",
      "path" : "Bundle.total",
      "max" : "0"
    },
    {
      "id" : "Bundle.link",
      "path" : "Bundle.link",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry",
      "path" : "Bundle.entry",
      "short" : "Innholdselementer i bundle",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Content entries in the bundle"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Inneholder ressursene som skal sendes inn til registeret",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Contains the resources to be submitted to the registry"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry.request",
      "path" : "Bundle.entry.request",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry.request.method",
      "path" : "Bundle.entry.request.method",
      "short" : "Må være POST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Must be POST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Angir at alle forespørsler i bundle må være av type POST",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Indicates that all requests in the bundle must be of type POST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "fixedCode" : "POST",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry.request.url",
      "path" : "Bundle.entry.request.url",
      "short" : "URL for requesten (påkrevd, men verdien har ingen betydning)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "URL for the request (required, but the value has no significance)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Representerer adressen for requesten. URL er påkrevd av FHIR-spesifikasjonen for transaction bundles, men selve verdien har ingen funksjonell betydning i dette tilfellet.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Represents the address for the request. The URL is required by the FHIR specification for transaction bundles, but the actual value has no functional significance in this case."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    }]
  }
}

```
