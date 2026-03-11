# Scenario-A-Episode - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Episode**

## Example Encounter: Scenario-A-Episode



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Scenario-A-Episode",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "stringIdentifier",
      "valueString" : "NPR-SYK-2025-001"
    }],
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
  }],
  "status" : "in-progress",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "serviceProvider" : {
    "reference" : "Organization/Scenario-A-Org-Avdeling"
  }
}

```
