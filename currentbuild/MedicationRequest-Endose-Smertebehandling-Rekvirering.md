# Endose-Smertebehandling-Rekvirering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Endose-Smertebehandling-Rekvirering**

## Example MedicationRequest: Endose-Smertebehandling-Rekvirering



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Endose-Smertebehandling-Rekvirering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "status" : "completed",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Endose-Smertebehandling-Morfin-Endose"
  },
  "subject" : {
    "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
  },
  "encounter" : {
    "reference" : "Encounter/Endose-Smertebehandling-Episode"
  },
  "authoredOn" : "2025-03-09",
  "requester" : {
    "reference" : "Practitioner/Endose-Smertebehandling-Rekvirent"
  },
  "reasonReference" : [{
    "reference" : "Condition/Endose-Smertebehandling-Diagnose"
  }]
}

```
