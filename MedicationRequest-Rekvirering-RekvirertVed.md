# Rekvirering-RekvirertVed - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.8

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-RekvirertVed**

## Example MedicationRequest: Rekvirering-RekvirertVed



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-RekvirertVed",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-rekvirert-ved",
    "valueReference" : {
      "reference" : "Organization/Organisasjon-Post"
    }
  }],
  "identifier" : [{
    "system" : "http://example.org/rekvirering-id",
    "value" : "8a4e6d2c-1b3f-4c5a-9e7d-0f2b4a6c8e13"
  }],
  "status" : "active",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
      "code" : "inpatient"
    }]
  }],
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelpakning"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "encounter" : {
    "reference" : "Encounter/Episode-Sykehus-Innleggelse"
  },
  "authoredOn" : "2025-06-14",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Med-HPR"
  },
  "dosageInstruction" : [{
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 50,
        "unit" : "mg",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      }
    }]
  }]
}

```
