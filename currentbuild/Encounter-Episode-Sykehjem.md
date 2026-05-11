# Episode-Sykehjem - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Sykehjem**

## Example Encounter: Episode-Sykehjem



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Sykehjem",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "status" : "in-progress",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "SS",
    "display" : "short stay"
  },
  "serviceProvider" : {
    "reference" : "Organization/Organisasjon-Sykehjem"
  }
}

```
