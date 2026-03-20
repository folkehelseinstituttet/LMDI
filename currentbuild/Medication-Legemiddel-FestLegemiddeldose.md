# Legemiddel-FestLegemiddeldose - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-FestLegemiddeldose**

## Example Medication: Legemiddel-FestLegemiddeldose



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-FestLegemiddeldose",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "A10AB05",
        "display" : "insulin aspart"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
      "code" : "ID_0008D107-4F34-470F-83CA-541F6E9FA3C4",
      "display" : "NovoRapid Flexpen inj, oppl 100 E/ml"
    }]
  }
}

```
