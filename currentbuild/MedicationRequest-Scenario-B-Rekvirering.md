# Scenario-B-Rekvirering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Rekvirering**

## Example MedicationRequest: Scenario-B-Rekvirering



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Scenario-B-Rekvirering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "status" : "completed",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Scenario-B-Medisin"
  },
  "subject" : {
    "reference" : "Patient/Scenario-B-Pasient"
  },
  "encounter" : {
    "reference" : "Encounter/Scenario-B-Episode"
  },
  "authoredOn" : "2025-03-09",
  "requester" : {
    "reference" : "Practitioner/Scenario-B-Helsepersonell"
  },
  "reasonReference" : [{
    "reference" : "Condition/Scenario-B-Diagnose"
  }]
}

```
