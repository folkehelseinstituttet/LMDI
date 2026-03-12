# Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling**

## Example Organization: Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "4201050"
  }],
  "name" : "Onkologisk avdeling, St. Olavs hospital",
  "address" : [{
    "type" : "physical",
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
