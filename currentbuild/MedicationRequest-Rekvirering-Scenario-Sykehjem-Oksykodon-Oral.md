# Rekvirering-Scenario-Sykehjem-Oksykodon-Oral - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Scenario-Sykehjem-Oksykodon-Oral**

## Example MedicationRequest: Rekvirering-Scenario-Sykehjem-Oksykodon-Oral



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Scenario-Sykehjem-Oksykodon-Oral",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "status" : "completed",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR"
  },
  "encounter" : {
    "reference" : "Encounter/Episode-Scenario-Sykehjem-Oksykodon-Opphold"
  },
  "authoredOn" : "2024-05-28T12:30:00+02:00",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent"
  }
}

```
