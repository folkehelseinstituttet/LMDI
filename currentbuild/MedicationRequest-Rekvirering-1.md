# Rekvirering-1 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-1**

## Example MedicationRequest: Rekvirering-1



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-1",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "identifier" : [{
    "system" : "http://example.org/rekvirering-id",
    "value" : "REK123456"
  }],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Medisin-2-Paracetamol"
  },
  "subject" : {
    "reference" : "Patient/Pasient-2-FNR"
  },
  "authoredOn" : "2025-01-27",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-1-HPR-nummer"
  }
}

```
