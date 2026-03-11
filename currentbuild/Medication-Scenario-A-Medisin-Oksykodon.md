# Scenario-A-Medisin-Oksykodon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Medisin-Oksykodon**

## Example Medication: Scenario-A-Medisin-Oksykodon



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Scenario-A-Medisin-Oksykodon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "N02AA05",
        "display" : "Oksykodon"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff",
      "code" : "C31AF94A-5D5A-4C91-9B99-BB221E26E4C9",
      "display" : "Oksykodon"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "51",
      "display" : "Mikstur, oppløsning"
    }]
  }
}

```
