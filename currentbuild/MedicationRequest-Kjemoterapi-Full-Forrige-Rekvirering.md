# Kjemoterapi-Full-Forrige-Rekvirering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kjemoterapi-Full-Forrige-Rekvirering**

## Example MedicationRequest: Kjemoterapi-Full-Forrige-Rekvirering



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Kjemoterapi-Full-Forrige-Rekvirering",
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
    "reference" : "Medication/Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
  },
  "subject" : {
    "reference" : "Patient/Kjemoterapi-Full-Pasient"
  },
  "encounter" : {
    "reference" : "Encounter/Kjemoterapi-Full-Episode"
  },
  "authoredOn" : "2025-02-24",
  "requester" : {
    "reference" : "Practitioner/Kjemoterapi-Full-Helsepersonell"
  },
  "reasonReference" : [{
    "reference" : "Condition/Kjemoterapi-Full-Diagnose"
  }],
  "courseOfTherapyType" : {
    "text" : "Kjemoterapikur"
  }
}

```
