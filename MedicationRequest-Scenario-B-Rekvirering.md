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

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**status**: Completed

**intent**: Order

**medication**: [Medication Morfin injeksjonsvæske 10 mg/ml](Medication-Scenario-B-Medisin.md)

**subject**: [Anonymous Patient Female, DoB: 2000-03-12 ( urn:oid:2.16.578.1.12.4.1.4.2#52030078901)](Patient-Scenario-B-Pasient.md)

**encounter**: [Encounter: extension = ; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Scenario-B-Episode.md)

**authoredOn**: 2025-03-09

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#7654321](Practitioner-Scenario-B-Helsepersonell.md)

**reasonReference**: [Condition Akutt smerte](Condition-Scenario-B-Diagnose.md)



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
