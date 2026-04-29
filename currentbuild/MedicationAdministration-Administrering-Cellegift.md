# Administrering-Cellegift - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [Home](en-index.md)
* [Information Model](en-informasjonsmodell.md)
* [Integration](en-integrasjon.md) 
* [Protocol](en-protokoll.md)
* [SignedEncryptedBundle](en-SignertKryptertBundle.md)
* [C# Example Code](en-eksempelkode_cs.md)
* [PowerShell Example Code](en-eksempelkode_ps1.md)
 
* [FHIR Profiles](en-profiler.md)
* [Downloads](en-nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Cellegift**

## Example MedicationAdministration: Administrering-Cellegift



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Cellegift",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "identifier" : [{
    "value" : "15634555315"
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Lokalt-legemiddel-cellegift"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus-2"
  },
  "effectivePeriod" : {
    "start" : "2026-04-01T12:12:00+02:00",
    "end" : "2026-04-01T13:45:00+02:00"
  },
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-Cellegift"
  },
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "intravenøs administrasjonsvei"
      }]
    },
    "dose" : {
      "value" : 1000,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    },
    "rateRatio" : {
      "numerator" : {
        "value" : 10,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "min"
      }
    }
  }
}

```
