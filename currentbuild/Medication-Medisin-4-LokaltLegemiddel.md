# Medisin-4-LokaltLegemiddel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medisin-4-LokaltLegemiddel**

## Example Medication: Medisin-4-LokaltLegemiddel



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medisin-4-LokaltLegemiddel",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel",
      "code" : "12345",
      "display" : "Spesialtilberedt kalsiumklorid-infusjon 10 mg/ml"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "9",
      "display" : "Infusjonsvæske, oppløsning"
    }]
  },
  "ingredient" : [{
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "387309003",
        "display" : "Calcium chloride (substance)"
      }]
    },
    "isActive" : true
  }]
}

```
