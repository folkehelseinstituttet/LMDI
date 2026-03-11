# Endosebasert smertebehandling med rekvirering, diagnose og administrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Endosebasert smertebehandling med rekvirering, diagnose og administrering**

## Example Bundle: Endosebasert smertebehandling med rekvirering, diagnose og administrering



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "Endose-Smertebehandling-Bundle",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"]
  },
  "identifier" : {
    "system" : "urn:oid:2.16.578.1.34.10.3",
    "value" : "endose-smertebehandling-bundle-001"
  },
  "type" : "transaction",
  "timestamp" : "2025-03-10T08:00:00+01:00",
  "entry" : [{
    "resource" : {
      "resourceType" : "Patient",
      "id" : "Endose-Smertebehandling-Pasient-Dnr",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.2",
        "value" : "52030078901"
      }],
      "gender" : "female",
      "birthDate" : "2000-03-12",
      "address" : [{
        "district" : "Bergen",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "4601",
              "display" : "Bergen"
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
      "id" : "Endose-Smertebehandling-Rekvirent",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.4",
        "value" : "7654321"
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
      "id" : "Endose-Smertebehandling-Sykehus",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
        "value" : "974557746"
      },
      {
        "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
        "value" : "4204191"
      }],
      "name" : "Haukeland universitetssjukehus",
      "address" : [{
        "type" : "physical",
        "district" : "Bergen",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "4601",
              "display" : "Bergen"
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
      "id" : "Endose-Smertebehandling-Episode",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      },
      "extension" : [{
        "extension" : [{
          "url" : "stringIdentifier",
          "valueString" : "NPR-HUS-2025-4567"
        }],
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
      }],
      "status" : "finished",
      "class" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP",
        "display" : "inpatient encounter"
      },
      "serviceProvider" : {
        "reference" : "Organization/Endose-Smertebehandling-Sykehus"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Encounter"
    }
  },
  {
    "resource" : {
      "resourceType" : "Condition",
      "id" : "Endose-Smertebehandling-Diagnose",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
      },
      "code" : {
        "coding" : [{
          "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
          "code" : "G89.1",
          "display" : "Akutt smerte"
        },
        {
          "system" : "http://snomed.info/sct",
          "code" : "274663001",
          "display" : "Acute pain (finding)"
        }]
      },
      "subject" : {
        "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
      },
      "stage" : [{
        "summary" : {
          "text" : "Akutt postoperativ smerte"
        }
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "Condition"
    }
  },
  {
    "resource" : {
      "resourceType" : "Medication",
      "id" : "Endose-Smertebehandling-Morfin-Endose",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "extension" : [{
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.whocc.no/atc",
            "code" : "N02AA01",
            "display" : "Morfin"
          }]
        }
      }],
      "code" : {
        "coding" : [{
          "system" : "http://dmp.no/fhir/NamingSystem/lmrLopenummer",
          "code" : "1234567",
          "display" : "Morfin endose 10 mg/ml"
        },
        {
          "system" : "http://dmp.no/fhir/NamingSystem/fest-varenummer",
          "code" : "476281",
          "display" : "Morfin injeksjonsvæske 10 mg/ml"
        }]
      },
      "form" : {
        "coding" : [{
          "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
          "code" : "11",
          "display" : "Injeksjonsvæske, oppløsning"
        }]
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Medication"
    }
  },
  {
    "resource" : {
      "resourceType" : "MedicationRequest",
      "id" : "Endose-Smertebehandling-Rekvirering",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
      },
      "status" : "completed",
      "intent" : "order",
      "medicationReference" : {
        "reference" : "Medication/Endose-Smertebehandling-Morfin-Endose"
      },
      "subject" : {
        "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
      },
      "encounter" : {
        "reference" : "Encounter/Endose-Smertebehandling-Episode"
      },
      "authoredOn" : "2025-03-09",
      "requester" : {
        "reference" : "Practitioner/Endose-Smertebehandling-Rekvirent"
      },
      "reasonReference" : [{
        "reference" : "Condition/Endose-Smertebehandling-Diagnose"
      }]
    },
    "request" : {
      "method" : "POST",
      "url" : "MedicationRequest"
    }
  },
  {
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "Endose-Smertebehandling-Administrering",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Endose-Smertebehandling-Morfin-Endose"
      },
      "subject" : {
        "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
      },
      "context" : {
        "reference" : "Encounter/Endose-Smertebehandling-Episode"
      },
      "effectiveDateTime" : "2025-03-09T22:30:00+01:00",
      "reasonReference" : [{
        "reference" : "Condition/Endose-Smertebehandling-Diagnose"
      }],
      "request" : {
        "reference" : "MedicationRequest/Endose-Smertebehandling-Rekvirering"
      },
      "dosage" : {
        "route" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "34206005",
            "display" : "Subcutaneous route (qualifier value)"
          },
          {
            "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
            "code" : "3",
            "display" : "Subkutan"
          }]
        },
        "dose" : {
          "value" : 5,
          "unit" : "mg",
          "system" : "http://unitsofmeasure.org",
          "code" : "mg"
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
