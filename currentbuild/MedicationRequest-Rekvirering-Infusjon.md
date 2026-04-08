# Rekvirering-Infusjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Infusjon**

## Example MedicationRequest: Rekvirering-Infusjon



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Infusjon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie",
    "valueBoolean" : false
  }],
  "status" : "active",
  "intent" : "original-order",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
      "code" : "inpatient"
    }]
  }],
  "reportedBoolean" : false,
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Lokalt-Med-Flere-Ingredienser"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "authoredOn" : "2024-05-31T21:00:01+02:00",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Med-HPR"
  },
  "dosageInstruction" : [{
    "asNeededBoolean" : true,
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "intravenøs administrasjonsvei"
      }]
    },
    "doseAndRate" : [{
      "rateRatio" : {
        "numerator" : {
          "value" : 2.5,
          "system" : "http://unitsofmeasure.org",
          "code" : "mL"
        },
        "denominator" : {
          "value" : 1,
          "system" : "http://unitsofmeasure.org",
          "code" : "min"
        }
      }
    }]
  }]
}

```
