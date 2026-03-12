# Rekvirering-Eksempel-Paracetamol - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Eksempel-Paracetamol**

## Example MedicationRequest: Rekvirering-Eksempel-Paracetamol



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Eksempel-Paracetamol",
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
    "reference" : "Medication/Legemiddel-Eksempel-Paracetamol-FEST-Merkevare"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Eksempel-Med-FNR"
  },
  "authoredOn" : "2025-01-27",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Eksempel-Med-HPR"
  }
}

```
