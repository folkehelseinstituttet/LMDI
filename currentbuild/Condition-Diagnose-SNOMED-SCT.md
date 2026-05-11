# Diagnose-SNOMED-SCT - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-SNOMED-SCT**

## Example Condition: Diagnose-SNOMED-SCT

Profile: [Diagnose](StructureDefinition-lmdi-condition.md)

**clinicalStatus**: Active

**code**: Artrose

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-SNOMED-SCT",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
    ]
  },
  "clinicalStatus" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
        "code" : "active"
      }
    ]
  },
  "code" : {
    "coding" : [
      {
        "system" : "http://snomed.info/sct",
        "code" : "396275006",
        "display" : "Artrose"
      }
    ]
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  }
}

```
