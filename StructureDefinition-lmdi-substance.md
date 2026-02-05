# Virkestoff - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Virkestoff**

## Resource Profile: Virkestoff 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance **  | *Version*:1.0.7 **  |
| Draft as of 2025-09-12 | *Computable Name*:Virkestoff |

 
En tilpasset profil av Substance for å representere virkestoff, basert på no-basis. 

**Usages:**

* Refer to this Profile: [Legemiddel](StructureDefinition-lmdi-medication.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-substance)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-substance.csv), [Excel](StructureDefinition-lmdi-substance.xlsx), [Schematron](StructureDefinition-lmdi-substance.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-substance",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance",
  "version" : "1.0.7",
  "name" : "Virkestoff",
  "title" : "Virkestoff",
  "status" : "draft",
  "date" : "2025-09-12",
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
  "description" : "En tilpasset profil av Substance for å representere virkestoff, basert på no-basis.",
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
  "kind" : "resource",
  "abstract" : false,
  "type" : "Substance",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-Substance",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Substance",
        "path" : "Substance"
      },
      {
        "id" : "Substance.text",
        "path" : "Substance.text",
        "max" : "0"
      },
      {
        "id" : "Substance.category",
        "path" : "Substance.category",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Substance.description",
        "path" : "Substance.description",
        "max" : "0"
      },
      {
        "id" : "Substance.ingredient",
        "path" : "Substance.ingredient",
        "max" : "0"
      }
    ]
  }
}

```
