# Rekvirering-Scenario-Smertebehandling-Morfin - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Scenario-Smertebehandling-Morfin**

## Example MedicationRequest: Rekvirering-Scenario-Smertebehandling-Morfin



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Scenario-Smertebehandling-Morfin",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "status" : "completed",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Smertebehandling-Morfin-Endose"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Smertebehandling-Med-DNR"
  },
  "encounter" : {
    "reference" : "Encounter/Episode-Scenario-Smertebehandling-Innleggelse"
  },
  "authoredOn" : "2025-03-09",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Scenario-Smertebehandling-Rekvirent"
  },
  "reasonReference" : [{
    "reference" : "Condition/Diagnose-Scenario-Smertebehandling-Postoperativ-Smerte"
  }]
}

```
