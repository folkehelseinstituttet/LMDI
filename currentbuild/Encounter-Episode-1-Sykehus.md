# Episode-1-Sykehus - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-1-Sykehus**

## Example Encounter: Episode-1-Sykehus

Profile: [Episode](StructureDefinition-lmdi-encounter.md)

> **NPR Episode Identifier**
* stringIdentifier: NPR987654321

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**serviceProvider**: [Organization Oslo universitetssykehus HF](Organization-Organisasjon-3-Sykehus.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-1-Sykehus",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "stringIdentifier",
      "valueString" : "NPR987654321"
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
    "reference" : "Organization/Organisasjon-3-Sykehus"
  }
}

```
