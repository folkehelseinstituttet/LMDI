# Organisasjon-Sykehusavdeling - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Sykehusavdeling**

## Example Organization: Organisasjon-Sykehusavdeling



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Sykehusavdeling",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "4208723"
  }],
  "type" : [{
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.8624",
      "code" : "05",
      "display" : "Avdeling"
    }]
  }],
  "name" : "Avdeling for epilepsi, poliklinikk",
  "address" : [{
    "type" : "physical",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "3201",
          "display" : "Bærum"
        }
      }]
    }
  }],
  "partOf" : {
    "reference" : "Organization/Organisasjon-Sykehus"
  }
}

```
