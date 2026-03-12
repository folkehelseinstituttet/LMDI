# Rekvirering-Scenario-Kjemoterapi-Full-Forrige - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Scenario-Kjemoterapi-Full-Forrige**

## Example MedicationRequest: Rekvirering-Scenario-Kjemoterapi-Full-Forrige



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Scenario-Kjemoterapi-Full-Forrige",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "identifier" : [{
    "system" : "http://example.org/rekvirering-id",
    "value" : "KJEMO-2025-001"
  }],
  "status" : "completed",
  "intent" : "order",
  "reportedBoolean" : false,
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Kjemoterapi-Full-Med-FNR"
  },
  "encounter" : {
    "reference" : "Encounter/Episode-Scenario-Kjemoterapi-Full-Innleggelse"
  },
  "authoredOn" : "2025-02-24",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Scenario-Kjemoterapi-Full-Rekvirent"
  },
  "reasonReference" : [{
    "reference" : "Condition/Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose"
  }],
  "courseOfTherapyType" : {
    "text" : "Kjemoterapikur"
  }
}

```
