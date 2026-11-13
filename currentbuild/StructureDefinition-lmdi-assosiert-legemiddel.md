# Assosiert legemiddel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.10

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Assosiert legemiddel**

## Extension: Assosiert legemiddel 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-assosiert-legemiddel **  | *Version*:1.1.10 **  |
| Active as of 2026-11-13 | *Computable Name*:AssosiertLegemiddel |

Angir mer spesifikt identifiserte legemidler (f.eks. med FestId eller Varenummer) som kan velges ved administrering av et overordnet eller generisk definert lokalt legemiddel.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Medication

**Usage info**

**Usages:**

* Use this Extension: [Legemiddel](StructureDefinition-lmdi-medication.md)
* Examples for this Extension: [Medication/Legemiddel-LokaltLegemiddel-AssosiertLegemiddel](Medication-Legemiddel-LokaltLegemiddel-AssosiertLegemiddel.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-assosiert-legemiddel.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-assosiert-legemiddel.csv), [Excel](StructureDefinition-lmdi-assosiert-legemiddel.xlsx), [Schematron](StructureDefinition-lmdi-assosiert-legemiddel.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-assosiert-legemiddel",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-assosiert-legemiddel",
  "version" : "1.1.10",
  "name" : "AssosiertLegemiddel",
  "title" : "Assosiert legemiddel",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Associated medication"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "date" : "2026-11-13T13:48:22+00:00",
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
  "description" : "Angir mer spesifikt identifiserte legemidler (f.eks. med FestId eller Varenummer) som kan velges ved administrering av et overordnet eller generisk definert lokalt legemiddel.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Specifies more specifically identified medications (e.g. by FEST ID or item number) that can be selected when administering a local medication defined at a higher or generic level."
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Medication"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Assosiert legemiddel",
      "definition" : "Angir mer spesifikt identifiserte legemidler (f.eks. med FestId eller Varenummer) som kan velges ved administrering av et overordnet eller generisk definert lokalt legemiddel.",
      "constraint" : [{
        "key" : "lmdi-assosiert-legemiddel-system",
        "severity" : "error",
        "human" : "Assosiert legemiddel skal være angitt med FEST-id (legemiddeldose, merkevare eller pakning), LMR-løpenummer, varenummer eller SNOMED CT-kode.",
        "expression" : "value.ofType(Coding).all(system in ('http://dmp.no/fhir/NamingSystem/festLegemiddelDose' | 'http://dmp.no/fhir/NamingSystem/lmrLopenummer' | 'http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare' | 'http://dmp.no/fhir/NamingSystem/festLegemiddelPakning' | 'http://dmp.no/fhir/NamingSystem/fest-varenummer' | 'http://snomed.info/sct'))",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-assosiert-legemiddel"
      }]
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-assosiert-legemiddel"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }]
    },
    {
      "id" : "Extension.value[x].system",
      "path" : "Extension.value[x].system",
      "min" : 1
    },
    {
      "id" : "Extension.value[x].code",
      "path" : "Extension.value[x].code",
      "min" : 1
    }]
  }
}

```
