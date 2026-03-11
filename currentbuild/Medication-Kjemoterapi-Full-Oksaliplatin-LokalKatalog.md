# Kjemoterapi-Full-Oksaliplatin-LokalKatalog - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kjemoterapi-Full-Oksaliplatin-LokalKatalog**

## Example Medication: Kjemoterapi-Full-Oksaliplatin-LokalKatalog



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Kjemoterapi-Full-Oksaliplatin-LokalKatalog",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "L01XA03",
        "display" : "Oksaliplatin"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel",
      "code" : "OXA-85-INF",
      "display" : "Oksaliplatin 85 mg/m2 infusjonsvæske"
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
    "itemReference" : {
      "reference" : "Substance/Kjemoterapi-Full-Virkestoff"
    },
    "isActive" : true
  }]
}

```
