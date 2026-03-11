# Kjemoterapi-Full-Pasient - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kjemoterapi-Full-Pasient**

## Example Patient: Kjemoterapi-Full-Pasient



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Kjemoterapi-Full-Pasient",
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
