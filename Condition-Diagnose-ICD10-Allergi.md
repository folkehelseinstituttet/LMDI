# Diagnose-ICD10-Allergi - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-ICD10-Allergi**

## Example Condition: Diagnose-ICD10-Allergi



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-ICD10-Allergi",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "J30",
      "display" : "Vasomotorisk og allergisk rhinitt"
    }]
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-DNR"
  }
}

```
