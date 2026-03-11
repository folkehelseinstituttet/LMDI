# Endose-Smertebehandling-Diagnose - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Endose-Smertebehandling-Diagnose**

## Example Condition: Endose-Smertebehandling-Diagnose



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Endose-Smertebehandling-Diagnose",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "code" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "G89.1",
      "display" : "Akutt smerte"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "274663001",
      "display" : "Acute pain (finding)"
    }]
  },
  "subject" : {
    "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
  },
  "stage" : [{
    "summary" : {
      "text" : "Akutt postoperativ smerte"
    }
  }]
}

```
