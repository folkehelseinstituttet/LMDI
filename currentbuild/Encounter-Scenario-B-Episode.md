# Scenario-B-Episode - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Episode**

## Example Encounter: Scenario-B-Episode

Profile: [Episode](StructureDefinition-lmdi-encounter.md)

> **NPR Episode Identifier**
* stringIdentifier: NPR-HUS-2025-4567

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**serviceProvider**: [Organization Haukeland universitetssjukehus](Organization-Scenario-B-Organisasjon.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Scenario-B-Episode",
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
    "reference" : "Organization/Scenario-B-Organisasjon"
  }
}

```
