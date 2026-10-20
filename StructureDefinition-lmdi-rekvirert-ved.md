# Rekvirert ved - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.8

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirert ved**

## Extension: Rekvirert ved 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-rekvirert-ved **  | *Version*:1.1.8 **  |
| Active as of 2026-10-20 | *Computable Name*:RekvirertVed |

Stedet (organisasjonen) rekvireringen ble utført. Rekvireringen refererer også til en episode, som igjen kan referere til en organisasjon. Rekvirert ved benyttes hvis episoden reflekterer hele innleggelsen, dvs. i tilfeller der episoden ikke gjenspeiler pasientens forflytninger (f.eks. mellom ulike avdelinger) under innleggelsen.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationRequest

**Usage info**

**Usages:**

* Use this Extension: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Extension: [MedicationRequest/Rekvirering-RekvirertVed](MedicationRequest-Rekvirering-RekvirertVed.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-rekvirert-ved.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-rekvirert-ved.csv), [Excel](StructureDefinition-lmdi-rekvirert-ved.xlsx), [Schematron](StructureDefinition-lmdi-rekvirert-ved.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-rekvirert-ved",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-rekvirert-ved",
  "version" : "1.1.8",
  "name" : "RekvirertVed",
  "title" : "Rekvirert ved",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Requested at (RekvirertVed)"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "date" : "2026-10-20T08:59:23+00:00",
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
  "description" : "Stedet (organisasjonen) rekvireringen ble utført. Rekvireringen refererer også til en episode, som igjen kan referere til en organisasjon. Rekvirert ved benyttes hvis episoden reflekterer hele innleggelsen, dvs. i tilfeller der episoden ikke gjenspeiler pasientens forflytninger (f.eks. mellom ulike avdelinger) under innleggelsen.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "The place (organization) where the request was made. The request also references an episode, which in turn may reference an organization. Requested at (RekvirertVed) is used if the episode reflects the entire admission, i.e. in cases where the episode does not reflect the patient's transfers (e.g. between different departments) during the admission."
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
    "expression" : "MedicationRequest"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Rekvirert ved",
      "definition" : "Stedet (organisasjonen) rekvireringen ble utført. Rekvireringen refererer også til en episode, som igjen kan referere til en organisasjon. Rekvirert ved benyttes hvis episoden reflekterer hele innleggelsen, dvs. i tilfeller der episoden ikke gjenspeiler pasientens forflytninger (f.eks. mellom ulike avdelinger) under innleggelsen."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-rekvirert-ved"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      }]
    }]
  }
}

```
