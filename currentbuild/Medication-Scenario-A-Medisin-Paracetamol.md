# Scenario-A-Medisin-Paracetamol - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Medisin-Paracetamol**

## Example Medication: Scenario-A-Medisin-Paracetamol



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Scenario-A-Medisin-Paracetamol",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "N02BE01",
        "display" : "Paracetamol"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "code" : "2ABAC272-0BCF-43F0-84BE-984074D92E15",
      "display" : "Paracet tab 500 mg"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "1",
      "display" : "Tablett"
    }]
  }
}

```
