# Pasient-Med-FNR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient-Med-FNR**

## Example Patient: Pasient-Med-FNR



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Pasient-Med-FNR",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
    "value" : "12705825562"
  }],
  "gender" : "male",
  "birthDate" : "1958-05-12",
  "address" : [{
    "extension" : [{
      "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-urban-district",
      "valueCoding" : {
        "system" : "urn:oid:2.16.578.1.12.4.1.1.3403",
        "code" : "030102",
        "display" : "Grünerløkka"
      }
    }],
    "use" : "home",
    "type" : "physical",
    "district" : "Oslo",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "0301",
          "display" : "Oslo"
        }
      }]
    }
  }]
}

```
