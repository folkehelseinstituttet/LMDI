# Scenario-B-Medisin - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Medisin**

## Example Medication: Scenario-B-Medisin

Profile: [Legemiddel](StructureDefinition-lmdi-medication.md)

**Legemiddel Classification**: Morfin

**code**: Morfin injeksjonsvæske 10 mg/ml

**form**: Injeksjonsvæske, oppløsning



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Scenario-B-Medisin",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "N02AA01",
        "display" : "Morfin"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "code" : "ID_81E2A556-B09B-4EC2-BA37-E3A9E3E0F6D0",
      "display" : "Morfin injeksjonsvæske 10 mg/ml"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "11",
      "display" : "Injeksjonsvæske, oppløsning"
    }]
  }
}

```
