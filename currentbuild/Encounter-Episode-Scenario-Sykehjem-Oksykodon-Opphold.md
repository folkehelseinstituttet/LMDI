# Episode-Scenario-Sykehjem-Oksykodon-Opphold - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Scenario-Sykehjem-Oksykodon-Opphold**

## Example Encounter: Episode-Scenario-Sykehjem-Oksykodon-Opphold



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Scenario-Sykehjem-Oksykodon-Opphold",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "stringIdentifier",
      "valueString" : "NPR123456789"
    },
    {
      "url" : "uuidIdentifier",
      "valueUuid" : "550e8400-e29b-41d4-a716-446655440000"
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
    "reference" : "Organization/Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem"
  }
}

```
