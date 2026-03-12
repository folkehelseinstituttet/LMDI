# Administrering-Eksempel-LogiskReferanse-Infusjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Eksempel-LogiskReferanse-Infusjon**

## Example MedicationAdministration: Administrering-Eksempel-LogiskReferanse-Infusjon



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Eksempel-LogiskReferanse-Infusjon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "identifier" : {
      "system" : "uri:eu:spor:idmp:mpid:dummy",
      "value" : "1a38f25a8791fc3270e7c388f2031eee"
    }
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "context" : {
    "reference" : "https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3"
  },
  "effectiveDateTime" : "2024-05-28T14:30:00+02:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "Intravenous route (qualifier value)"
      }]
    },
    "dose" : {
      "value" : 100,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
