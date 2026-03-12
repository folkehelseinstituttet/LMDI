# Episode-Scenario-Smertebehandling-Innleggelse - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Scenario-Smertebehandling-Innleggelse**

## Example Encounter: Episode-Scenario-Smertebehandling-Innleggelse



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Scenario-Smertebehandling-Innleggelse",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "stringIdentifier",
      "valueString" : "NPR-HUS-2025-4567"
    }],
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
  }],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "serviceProvider" : {
    "reference" : "Organization/Organisasjon-Scenario-Smertebehandling-Sykehus"
  }
}

```
