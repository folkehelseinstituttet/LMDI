# Diagnose-1-ICD10-OID - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-1-ICD10-OID**

## Example Condition: Diagnose-1-ICD10-OID



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-1-ICD10-OID",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "code" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "R63.3",
      "display" : "Vanskeligheter med inntak og tilførsel av mat"
    }]
  },
  "subject" : {
    "reference" : "Patient/Pasient-2-FNR"
  }
}

```
