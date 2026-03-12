# Episode-Scenario-Sykehjem-Minimum-Opphold - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Scenario-Sykehjem-Minimum-Opphold**

## Example Encounter: Episode-Scenario-Sykehjem-Minimum-Opphold



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Scenario-Sykehjem-Minimum-Opphold",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "status" : "in-progress",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "serviceProvider" : {
    "reference" : "Organization/Organisasjon-Scenario-Sykehjem-Minimum-Avdeling"
  }
}

```
