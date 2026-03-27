# Organisasjon-Sykehus - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Sykehus**

## Example Organization: Organisasjon-Sykehus



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Sykehus",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "974705761"
  }],
  "type" : [{
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.8624",
      "code" : "01",
      "display" : "Sykehus"
    }]
  }],
  "name" : "OSLO UNIVERSITETSSYKEHUS HF SPESIALSYKEHUSET FOR EPILEPSI SSE - SOMATIKK",
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
    "reference" : "Organization/Organisasjon-HF"
  }
}

```
