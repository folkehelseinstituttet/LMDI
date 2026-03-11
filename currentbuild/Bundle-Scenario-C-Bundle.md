# Scenario C - Kjemoterapi Bundle - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario C - Kjemoterapi Bundle**

## Example Bundle: Scenario C - Kjemoterapi Bundle



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "Scenario-C-Bundle",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"]
  },
  "identifier" : {
    "system" : "urn:oid:2.16.578.1.34.10.3",
    "value" : "scenario-c-bundle-001"
  },
  "type" : "transaction",
  "timestamp" : "2025-03-10T12:00:00+01:00",
  "entry" : [{
    "resource" : {
      "resourceType" : "Patient",
      "id" : "Scenario-C-Pasient",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
        "value" : "15076500565"
      }],
      "gender" : "male",
      "birthDate" : "1965-07-15",
      "address" : [{
        "district" : "Trondheim",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "5001",
              "display" : "Trondheim"
            }
          }]
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Patient"
    }
  },
  {
    "resource" : {
      "resourceType" : "Practitioner",
      "id" : "Scenario-C-Helsepersonell",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.4",
        "value" : "8877665"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Practitioner"
    }
  },
  {
    "resource" : {
      "resourceType" : "Organization",
      "id" : "Scenario-C-Organisasjon",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
        "value" : "4201050"
      }],
      "name" : "Onkologisk avdeling, St. Olavs hospital",
      "address" : [{
        "type" : "physical",
        "district" : "Trondheim",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "5001",
              "display" : "Trondheim"
            }
          }]
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "resource" : {
      "resourceType" : "Encounter",
      "id" : "Scenario-C-Episode",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      },
      "extension" : [{
        "extension" : [{
          "url" : "stringIdentifier",
          "valueString" : "NPR-STOL-2025-789"
        }],
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
      }],
      "status" : "in-progress",
      "class" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP",
        "display" : "inpatient encounter"
      },
      "serviceProvider" : {
        "reference" : "Organization/Scenario-C-Organisasjon"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Encounter"
    }
  },
  {
    "resource" : {
      "resourceType" : "Medication",
      "id" : "Scenario-C-Medisin",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "code" : {
        "coding" : [{
          "system" : "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel",
          "code" : "OXA-85-INF",
          "display" : "Oksaliplatin 85 mg/m2 infusjonsvæske"
        }]
      },
      "form" : {
        "coding" : [{
          "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
          "code" : "9",
          "display" : "Infusjonsvæske, oppløsning"
        }]
      },
      "ingredient" : [{
        "itemReference" : {
          "reference" : "Substance/Scenario-C-Virkestoff"
        },
        "isActive" : true
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Medication"
    }
  },
  {
    "resource" : {
      "resourceType" : "MedicationRequest",
      "id" : "Scenario-C-Rekvirering",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
      },
      "extension" : [{
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring",
        "valueQuantity" : {
          "value" : 80,
          "unit" : "%",
          "system" : "http://unitsofmeasure.org",
          "code" : "%"
        }
      },
      {
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime",
        "valueString" : "FOLFOX6"
      },
      {
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie",
        "valueBoolean" : true
      }],
      "status" : "active",
      "intent" : "order",
      "medicationReference" : {
        "reference" : "Medication/Scenario-C-Medisin"
      },
      "subject" : {
        "reference" : "Patient/Scenario-C-Pasient"
      },
      "encounter" : {
        "reference" : "Encounter/Scenario-C-Episode"
      },
      "authoredOn" : "2025-03-10",
      "requester" : {
        "reference" : "Practitioner/Scenario-C-Helsepersonell"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationRequest"
    }
  },
  {
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "Scenario-C-Administrering",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Scenario-C-Medisin"
      },
      "subject" : {
        "reference" : "Patient/Scenario-C-Pasient"
      },
      "context" : {
        "reference" : "Encounter/Scenario-C-Episode"
      },
      "effectivePeriod" : {
        "start" : "2025-03-10T09:00:00+01:00",
        "end" : "2025-03-10T11:00:00+01:00"
      },
      "request" : {
        "reference" : "MedicationRequest/Scenario-C-Rekvirering"
      },
      "dosage" : {
        "route" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "47625008",
            "display" : "Intravenous route (qualifier value)"
          }]
        },
        "dose" : {
          "value" : 170,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
        },
        "rateRatio" : {
          "numerator" : {
            "value" : 250,
            "system" : "http://unitsofmeasure.org",
            "code" : "ml"
          },
          "denominator" : {
            "value" : 120,
            "system" : "http://unitsofmeasure.org",
            "code" : "min"
          }
        }
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationAdministration"
    }
  }]
}

```
