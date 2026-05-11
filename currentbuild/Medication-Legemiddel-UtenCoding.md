# Legemiddel-UtenCoding - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-UtenCoding**

## Example Medication: Legemiddel-UtenCoding



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-UtenCoding",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "ingredient" : [{
    "itemReference" : {
      "reference" : "Medication/Legemiddel-Legemiddeldose-SmofKabiven"
    }
  },
  {
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
        "code" : "ID_3BDBA6F5-AE18-4A03-949A-A10BE4C085D0",
        "display" : "Soluvit pulv til inf væske oppl"
      }]
    }
  },
  {
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
        "code" : "ID_4440528A-4654-4C34-A36B-B85251A5410F",
        "display" : "Vitalipid Infant kons til inf emul"
      }]
    }
  }]
}

```
