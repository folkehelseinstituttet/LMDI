# Sykehjem-Minimum-Pasient - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sykehjem-Minimum-Pasient**

## Example Patient: Sykehjem-Minimum-Pasient



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Sykehjem-Minimum-Pasient",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
    "value" : "12045678901"
  }]
}

```
