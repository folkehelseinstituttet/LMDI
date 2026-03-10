# Scenario-B-Helsepersonell - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Helsepersonell**

## Example Practitioner: Scenario-B-Helsepersonell

Profile: [Helsepersonell](StructureDefinition-lmdi-practitioner.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.4`/7654321



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "Scenario-B-Helsepersonell",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.4",
    "value" : "7654321"
  }]
}

```
