# Klinisk studie - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Klinisk studie**

## Extension: Klinisk studie 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie **  | *Version*:1.0.8 **  |
| Draft as of 2026-03-18 | *Computable Name*:KliniskStudie |

Angir om legemidlet gis som en del av en klinisk studie.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationRequest

**Usage info**

**Usages:**

* Use this Extension: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Extension: [Bundle/Bundle-Scenario-Sykehjem-Oksykodon](Bundle-Bundle-Scenario-Sykehjem-Oksykodon.md) and [MedicationRequest/Rekvirering-Kjemoterapi](MedicationRequest-Rekvirering-Kjemoterapi.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-klinisk-studie)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-klinisk-studie.csv), [Excel](StructureDefinition-lmdi-klinisk-studie.xlsx), [Schematron](StructureDefinition-lmdi-klinisk-studie.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-klinisk-studie",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie",
  "version" : "1.0.8",
  "name" : "KliniskStudie",
  "title" : "Klinisk studie",
  "status" : "draft",
  "date" : "2026-03-18T15:02:12+00:00",
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
  "description" : "Angir om legemidlet gis som en del av en klinisk studie.",
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
    "expression" : "MedicationRequest"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Klinisk studie",
      "definition" : "Angir om legemidlet gis som en del av en klinisk studie."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "boolean"
      }]
    }]
  }
}

```
