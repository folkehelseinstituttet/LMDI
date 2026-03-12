# Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose**

## Example Condition: Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "code" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "C18.7",
      "display" : "Ondartet svulst i sigmoideum"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "363406005",
      "display" : "Malignant tumor of colon"
    }]
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Kjemoterapi-Full-Med-FNR"
  },
  "stage" : [{
    "summary" : {
      "text" : "Adjuvant kjemoterapi etter colorectal cancer"
    }
  }]
}

```
