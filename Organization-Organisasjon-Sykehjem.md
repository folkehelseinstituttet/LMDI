# Organisasjon-Sykehjem - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Sykehjem**

## Example Organization: Organisasjon-Sykehjem



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Sykehjem",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "985626154"
  }],
  "name" : "BYNESET OG NYPANTUNET HELSE- OG VELFERDSSENTER SYKEHJEM",
  "address" : [{
    "type" : "physical",
    "district" : "Trondheim",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "5001",
          "display" : "Trondheim - Tråante"
        }
      }]
    }
  }],
  "partOf" : {
    "reference" : "Organization/Organisasjon-Kommune"
  }
}

```
