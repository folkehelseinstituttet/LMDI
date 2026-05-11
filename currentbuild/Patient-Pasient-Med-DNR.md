# Pasient-Med-DNR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient-Med-DNR**

## Example Patient: Pasient-Med-DNR



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Pasient-Med-DNR",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.2",
    "value" : "41667987421"
  }],
  "birthDate" : "1979-01-01",
  "address" : [{
    "state" : "Vestland"
  }]
}

```
