# Administrering-AdministrertVed - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.8

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-AdministrertVed**

## Example MedicationAdministration: Administrering-AdministrertVed



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-AdministrertVed",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-administrert-ved",
    "valueReference" : {
      "reference" : "Organization/Organisasjon-Post"
    }
  }],
  "identifier" : [{
    "value" : "3f2b8c1e-9d47-4a6b-8e15-2c7d9a0f4b61"
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelpakning"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus-Innleggelse"
  },
  "effectiveDateTime" : "2025-06-14T08:15:00+02:00",
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-RekvirertVed"
  },
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
        "code" : "53",
        "display" : "Oral bruk"
      }]
    },
    "dose" : {
      "value" : 50,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
