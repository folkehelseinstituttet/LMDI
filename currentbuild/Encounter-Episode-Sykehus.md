# Episode-Sykehus - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Sykehus**

## Example Encounter: Episode-Sykehus

Profile: [Episode](StructureDefinition-lmdi-encounter.md)

> **NPR Episode Identifier**
* stringIdentifier: NPR987654321
* uuidIdentifier: urn:uuid:550e8400-e29b-41d4-a716-446655440000

**identifier**: 550e8400-e29b-41d4-a716-446655440000

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**serviceProvider**: [Organization Avdeling for epilepsi, poliklinikk](Organization-Organisasjon-Sykehusavdeling.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Sykehus",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "stringIdentifier",
          "valueString" : "NPR987654321"
        },
        {
          "url" : "uuidIdentifier",
          "valueUuid" : "urn:uuid:550e8400-e29b-41d4-a716-446655440000"
        }
      ],
      "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
    }
  ],
  "identifier" : [
    {
      "value" : "550e8400-e29b-41d4-a716-446655440000"
    }
  ],
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "serviceProvider" : {
    "reference" : "Organization/Organisasjon-Sykehusavdeling"
  }
}

```
