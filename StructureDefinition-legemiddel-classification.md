# Legemiddel Classification - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel Classification**

## Extension: Legemiddel Classification 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification **  | *Version*:1.0.7 **  |
| Active as of 2025-09-12 | *Computable Name*:LegemiddelClassification |

Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister).

**Context of Use**

This extension may be used on the following element(s):

* Element ID Medication

**Usage info**

**Usages:**

* Use this Extension: [Legemiddel](StructureDefinition-lmdi-medication.md)
* Examples for this Extension: [Medication/Medisin-1-LegemiddelDose-Oxycodone](Medication-Medisin-1-LegemiddelDose-Oxycodone.md), [Medication/Medisin-2-Paracetamol](Medication-Medisin-2-Paracetamol.md) and [Medication/Medisin-3-LegemiddelPakning-Monoket](Medication-Medisin-3-LegemiddelPakning-Monoket.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/legemiddel-classification)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-legemiddel-classification.csv), [Excel](StructureDefinition-legemiddel-classification.xlsx), [Schematron](StructureDefinition-legemiddel-classification.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "legemiddel-classification",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
  "version" : "1.0.7",
  "name" : "LegemiddelClassification",
  "title" : "Legemiddel Classification",
  "status" : "active",
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
  "description" : "Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister).",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Medication"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Legemiddel Classification",
        "definition" : "Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister)."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "mustSupport" : true,
        "binding" : {
          "strength" : "preferred",
          "description" : "ATC kode fra WHO ATC kodesystem",
          "valueSet" : "http://fhir.no/ValueSet/atc-valueset"
        }
      }
    ]
  }
}

```
