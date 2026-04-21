# Rekvirering-Cellegift - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Cellegift**

## Example MedicationRequest: Rekvirering-Cellegift



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Cellegift",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring",
    "valueQuantity" : {
      "value" : 50,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  },
  {
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime",
    "valueString" : "B102 Gastro, ECX, Epirubicin, Cisplatin, Xeloda"
  }],
  "identifier" : [{
    "system" : "http://example.org/rekvirering-id",
    "value" : "46456453321544556324"
  }],
  "status" : "unknown",
  "intent" : "original-order",
  "medicationReference" : {
    "reference" : "Medication/Lokalt-legemiddel-cellegift"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "authoredOn" : "2026-03-28",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Uten-HPR"
  },
  "dosageInstruction" : [{
    "timing" : {
      "repeat" : {
        "count" : 5,
        "frequency" : 1,
        "period" : 1,
        "periodUnit" : "mo"
      }
    },
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "intravenøs administrasjonsvei"
      }]
    },
    "doseAndRate" : [{
      "doseQuantity" : {
        "value" : 1025,
        "unit" : "milligram",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "rateQuantity" : {
        "value" : 12,
        "unit" : "milligram per minute",
        "system" : "http://unitsofmeasure.org",
        "code" : "mg/min"
      }
    }]
  }]
}

```
