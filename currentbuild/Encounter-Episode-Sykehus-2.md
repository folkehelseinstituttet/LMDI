# Episode-Sykehus-2 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode-Sykehus-2**

## Example Encounter: Episode-Sykehus-2

Profile: [Episode](StructureDefinition-lmdi-encounter.md)

**status**: Finished

**class**: [ActCode: IMP](http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP) (inpatient encounter)

**serviceProvider**: [Organization HMR ÅLE SH Kreft og blodsjukdommar sengepost](Organization-Organisasjon-Post.md)



## Resource Content

```json
{
  "resourceType" : "Encounter",
  "id" : "Episode-Sykehus-2",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
    ]
  },
  "status" : "finished",
  "class" : {
    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
    "code" : "IMP",
    "display" : "inpatient encounter"
  },
  "serviceProvider" : {
    "reference" : "Organization/Organisasjon-Post"
  }
}

```
