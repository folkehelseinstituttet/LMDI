# Episode-Scenario-Kjemoterapi-Full-Innleggelse - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Scenario-Kjemoterapi-Full-Innleggelse**

## Example Encounter: Episode-Scenario-Kjemoterapi-Full-Innleggelse



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Scenario-Kjemoterapi-Full-Innleggelse",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "stringIdentifier",
      "valueString" : "NPR-STOL-2025-789"
    },
    {
      "url" : "uuidIdentifier",
      "valueUuid" : "9b1deb4d-5b8b-4f83-8f9d-101c6a4a2dd9"
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
    "reference" : "Organization/Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling"
  }
}

```
