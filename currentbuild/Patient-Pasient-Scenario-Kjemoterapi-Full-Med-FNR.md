# Pasient-Scenario-Kjemoterapi-Full-Med-FNR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient-Scenario-Kjemoterapi-Full-Med-FNR**

## Example Patient: Pasient-Scenario-Kjemoterapi-Full-Med-FNR



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Pasient-Scenario-Kjemoterapi-Full-Med-FNR",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
    "value" : "15076500565"
  }],
  "gender" : "male",
  "birthDate" : "1965-07-15",
  "address" : [{
    "use" : "home",
    "district" : "Trondheim",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "5001",
          "display" : "Trondheim"
        }
      }]
    }
  }]
}

```
