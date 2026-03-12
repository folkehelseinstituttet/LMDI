# Pasient-Eksempel-Uten-FNR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient-Eksempel-Uten-FNR**

## Example Patient: Pasient-Eksempel-Uten-FNR



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Pasient-Eksempel-Uten-FNR",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "gender" : "female",
  "birthDate" : "1958-09-19",
  "address" : [{
    "district" : "Bærum",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "3024",
          "display" : "Bærum"
        }
      }]
    }
  }]
}

```
