# Organisasjon-Seksjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Seksjon**

## Example Organization: Organisasjon-Seksjon



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Seksjon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "4223264"
  }],
  "type" : [{
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.8624",
      "code" : "06",
      "display" : "Seksjon"
    }]
  }],
  "name" : "Kreft og blodsykdommer sengepost Ålesund",
  "partOf" : {
    "reference" : "Organization/Organisasjon-Sykehus-2"
  }
}

```
