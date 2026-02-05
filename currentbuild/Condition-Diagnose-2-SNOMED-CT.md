# Diagnose-2-SNOMED-CT - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-2-SNOMED-CT**

## Example Condition: Diagnose-2-SNOMED-CT

Profile: [Diagnose](StructureDefinition-lmdi-condition.md)

**code**: Høydeskrekk

**subject**: [Anonymous Patient (no stated gender), DoB Unknown](Patient-eksempel-pasient-1234567890.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-2-SNOMED-CT",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "276241001",
        "display" : "frykt for høyder"
      },
      {
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
        "code" : "F40.2",
        "display" : "Spesifikke (isolerte) fobier"
      }
    ],
    "text" : "Høydeskrekk"
  },
  "subject" : {
    "reference" : "Patient/eksempel-pasient-1234567890"
  }
}

```
