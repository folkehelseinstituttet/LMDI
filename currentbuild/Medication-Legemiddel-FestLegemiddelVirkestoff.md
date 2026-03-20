# Legemiddel-FestLegemiddelVirkestoff - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-FestLegemiddelVirkestoff**

## Example Medication: Legemiddel-FestLegemiddelVirkestoff



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-FestLegemiddelVirkestoff",
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
      "code" : "ID_128B21F2-34CE-4FEF-81CA-AD3BD9A5690E",
      "display" : "Oksykodon mikst oppl 1 mg/ml"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "842",
      "display" : "Mikstur, oppløsning"
    }]
  }
}

```
