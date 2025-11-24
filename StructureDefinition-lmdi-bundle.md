# LegemiddelregisterBundle - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **LegemiddelregisterBundle**

## Resource Profile: LegemiddelregisterBundle 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle** | *Version*:1.0.7** |
| Draft as of 2025-11-24 | *Computable Name*:LegemiddelregisterBundle |

 
Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. 

**Usages:**

* Examples for this Profile: [Bundle/LegemiddelregisterBundle-1](Bundle-LegemiddelregisterBundle-1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-bundle)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-bundle.csv), [Excel](StructureDefinition-lmdi-bundle.xlsx), [Schematron](StructureDefinition-lmdi-bundle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-bundle",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle",
  "version" : "1.0.7",
  "name" : "LegemiddelregisterBundle",
  "title" : "LegemiddelregisterBundle",
  "status" : "draft",
  "date" : "2025-11-24T09:13:45+00:00",
  "publisher" : "Folkehelseinstituttet",
  "contact" : [
    {
      "name" : "Folkehelseinstituttet",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.fhi.no"
        }
      ]
    },
    {
      "name" : "Legemiddelregisteret",
      "telecom" : [
        {
          "system" : "email",
          "value" : "legemiddelregisteret@fhi.no"
        }
      ]
    }
  ],
  "description" : "Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "NO",
          "display" : "Norway"
        }
      ]
    }
  ],
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Bundle",
        "path" : "Bundle",
        "constraint" : [
          {
            "key" : "lr-allowed-resources",
            "severity" : "error",
            "human" : "Bundle kan bare inneholde følgende profilerte ressurstyper: Diagnose, Helsepersonell, Episode, Legemiddel, LegemiddelAdministrasjon, Legemiddelrekvirering, Organisasjon, Pasient",
            "expression" : "entry.all(\n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization').exists() or \n  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient').exists()\n)",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"
          }
        ]
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
        "definition" : "Angir at bundle må være av type transaction",
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
        "definition" : "Inneholder ressursene som skal sendes inn til registeret",
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
        "definition" : "Angir at alle forespørsler i bundle må være av type POST",
        "fixedCode" : "POST",
        "mustSupport" : true
      },
      {
        "id" : "Bundle.entry.request.url",
        "path" : "Bundle.entry.request.url",
        "short" : "URL for requesten (påkrevd, men verdien har ingen betydning)",
        "definition" : "Representerer addressen for requesten. URL er påkrevd av FHIR-spesifikasjonen for transaction bundles, men selve verdien har ingen funksjonell betydning i dette tilfellet."
      }
    ]
  }
}

```
