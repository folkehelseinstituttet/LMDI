# Legemiddel-Legemiddeldose-SmofKabiven - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-Legemiddeldose-SmofKabiven**

## Example Medication: Legemiddel-Legemiddeldose-SmofKabiven



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-Legemiddeldose-SmofKabiven",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "B05BA10",
        "display" : "Kombinasjoner"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
      "code" : "ID_58EA43B8-817A-4CCC-8C88-A780399018E3",
      "display" : "SmofKabiven inf, emul"
    }]
  }
}

```
