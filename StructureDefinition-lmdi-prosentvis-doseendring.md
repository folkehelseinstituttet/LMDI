# Prosentvis doseendring - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Prosentvis doseendring**

## Extension: Prosentvis doseendring 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring** | *Version*:1.0.7** |
| Draft as of 2025-10-18 | *Computable Name*:ProsentvisDoseendring |

Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Element

**Usage info**

**Usages:**

* Use this Extension: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-prosentvis-doseendring)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-prosentvis-doseendring.csv), [Excel](StructureDefinition-lmdi-prosentvis-doseendring.xlsx), [Schematron](StructureDefinition-lmdi-prosentvis-doseendring.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-prosentvis-doseendring",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring",
  "version" : "1.0.7",
  "name" : "ProsentvisDoseendring",
  "title" : "Prosentvis doseendring",
  "status" : "draft",
  "date" : "2025-10-18T06:27:30+00:00",
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
  "description" : "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi.",
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
      "expression" : "Element"
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
        "short" : "Prosentvis doseendring",
        "definition" : "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "type" : [
          {
            "code" : "Quantity"
          }
        ]
      },
      {
        "id" : "Extension.value[x].unit",
        "path" : "Extension.value[x].unit",
        "patternString" : "%"
      },
      {
        "id" : "Extension.value[x].system",
        "path" : "Extension.value[x].system",
        "patternUri" : "http://unitsofmeasure.org"
      },
      {
        "id" : "Extension.value[x].code",
        "path" : "Extension.value[x].code",
        "patternCode" : "%"
      }
    ]
  }
}

```
