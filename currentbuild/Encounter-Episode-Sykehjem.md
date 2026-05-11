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

Profile: [Episode](StructureDefinition-lmdi-encounter.md)

**status**: In Progress

**class**: [ActCode: SS](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-SS) (short stay)

**serviceProvider**: [Organization BYNESET OG NYPANTUNET HELSE- OG VELFERDSSENTER SYKEHJEM](Organization-Organisasjon-Sykehjem.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Sykehjem",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    ]
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
