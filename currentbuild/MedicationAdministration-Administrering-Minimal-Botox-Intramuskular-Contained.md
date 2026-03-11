# Administrering-Minimal-Botox-Intramuskular-Contained - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Minimal-Botox-Intramuskular-Contained**

## Example MedicationAdministration: Administrering-Minimal-Botox-Intramuskular-Contained



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Minimal-Botox-Intramuskular-Contained",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "contained" : [{
    "resourceType" : "Medication",
    "id" : "Legemiddel-Contained-Botox-FestPakning",
    "meta" : {
      "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
    },
    "extension" : [{
      "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
      "valueCodeableConcept" : {
        "coding" : [{
          "system" : "http://www.whocc.no/atc",
          "code" : "M03AX01",
          "display" : "Botulinumtoksin"
        }]
      }
    }],
    "code" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
        "code" : "ID_00B35335-0DF7-4C98-8A0A-1148F4599D21",
        "display" : "Botox pulv til inj væske, oppl 50 E"
      },
      {
        "system" : "http://dmp.no/fhir/NamingSystem/fest-varenummer",
        "code" : "476281",
        "display" : "Botox pulv til inj væske, oppl 50 E"
      }]
    },
    "form" : {
      "coding" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
        "code" : "36",
        "display" : "Pulver til injeksjonsvæske, oppløsning"
      }]
    }
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "#Legemiddel-Contained-Botox-FestPakning"
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "effectiveDateTime" : "2024-05-28T10:00:00+02:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "78421000",
        "display" : "Intramuscular route (qualifier value)"
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
