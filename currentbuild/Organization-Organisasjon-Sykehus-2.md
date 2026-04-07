# Organisasjon-Sykehus-2 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Sykehus-2**

## Example Organization: Organisasjon-Sykehus-2



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Sykehus-2",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "974747138"
  }],
  "type" : [{
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.8624",
      "code" : "01",
      "display" : "Sykehus"
    }]
  }],
  "name" : "Helse Møre og Romsdal HF Ålesund sjukehus - Somatikk",
  "partOf" : {
    "reference" : "Organization/Organisasjon-HF-2"
  }
}

```
