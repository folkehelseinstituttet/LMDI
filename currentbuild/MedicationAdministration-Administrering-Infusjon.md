# Administrering-Infusjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Infusjon**

## Example MedicationAdministration: Administrering-Infusjon



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Infusjon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Lokalt-Med-Flere-Ingredienser"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectivePeriod" : {
    "start" : "2024-06-13T14:26:01+02:00",
    "end" : "2024-06-13T14:48:47+02:00"
  },
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-Infusjon"
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
      "value" : 80,
      "unit" : "milliliter",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    },
    "rateRatio" : {
      "numerator" : {
        "value" : 3.6,
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
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
