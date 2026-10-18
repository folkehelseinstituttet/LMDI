# Episode-Sykehus-Innleggelse - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.8

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Sykehus-Innleggelse**

## Example Encounter: Episode-Sykehus-Innleggelse



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Sykehus-Innleggelse",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "serviceProvider" : {
    "reference" : "Organization/Organisasjon-Sykehus-2"
  }
}

```
