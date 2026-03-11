# Scenario-B-Pasient - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Pasient**

## Example Patient: Scenario-B-Pasient



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Scenario-B-Pasient",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.2",
    "value" : "52030078901"
  }],
  "gender" : "female",
  "birthDate" : "2000-03-12",
  "address" : [{
    "district" : "Bergen",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "4601",
          "display" : "Bergen"
        }
      }]
    }
  }]
}

```
