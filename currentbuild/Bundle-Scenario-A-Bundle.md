# Scenario A - Sykehjemsadministrering Bundle - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario A - Sykehjemsadministrering Bundle**

## Example Bundle: Scenario A - Sykehjemsadministrering Bundle



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "Scenario-A-Bundle",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"]
  },
  "identifier" : {
    "system" : "urn:oid:2.16.578.1.34.10.3",
    "value" : "scenario-a-bundle-001"
  },
  "type" : "transaction",
  "timestamp" : "2025-03-10T09:00:00+01:00",
  "entry" : [{
    "resource" : {
      "resourceType" : "Patient",
      "id" : "Scenario-A-Pasient",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
        "value" : "12045678901"
      }],
      "gender" : "female",
      "birthDate" : "1945-04-12",
      "address" : [{
        "district" : "Drammen",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "3005",
              "display" : "Drammen"
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
      "resourceType" : "Organization",
      "id" : "Scenario-A-Org-Avdeling",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
        "value" : "7100001"
      }],
      "name" : "Avdeling 2B, Soltoppen sykehjem",
      "partOf" : {
        "reference" : "Organization/Scenario-A-Org-Sykehjem"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "resource" : {
      "resourceType" : "Organization",
      "id" : "Scenario-A-Org-Sykehjem",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
        "value" : "987654321"
      }],
      "name" : "Soltoppen sykehjem",
      "address" : [{
        "type" : "physical",
        "district" : "Drammen",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "3005",
              "display" : "Drammen"
            }
          }]
        }
      }],
      "partOf" : {
        "reference" : "Organization/Scenario-A-Org-Kommune"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "resource" : {
      "resourceType" : "Organization",
      "id" : "Scenario-A-Org-Kommune",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
        "value" : "938726027"
      }],
      "name" : "Drammen kommune",
      "address" : [{
        "type" : "physical",
        "district" : "Drammen",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "3005",
              "display" : "Drammen"
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
      "id" : "Scenario-A-Episode",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      },
      "extension" : [{
        "extension" : [{
          "url" : "stringIdentifier",
          "valueString" : "NPR-SYK-2025-001"
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
        "reference" : "Organization/Scenario-A-Org-Avdeling"
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
      "id" : "Scenario-A-Medisin-Paracetamol",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "extension" : [{
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.whocc.no/atc",
            "code" : "N02BE01",
            "display" : "Paracetamol"
          }]
        }
      }],
      "code" : {
        "coding" : [{
          "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
          "code" : "2ABAC272-0BCF-43F0-84BE-984074D92E15",
          "display" : "Paracet tab 500 mg"
        }]
      },
      "form" : {
        "coding" : [{
          "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
          "code" : "1",
          "display" : "Tablett"
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
      "resourceType" : "Medication",
      "id" : "Scenario-A-Medisin-Oksykodon",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "extension" : [{
        "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
        "valueCodeableConcept" : {
          "coding" : [{
            "system" : "http://www.whocc.no/atc",
            "code" : "N02AA05",
            "display" : "Oksykodon"
          }]
        }
      }],
      "code" : {
        "coding" : [{
          "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff",
          "code" : "C31AF94A-5D5A-4C91-9B99-BB221E26E4C9",
          "display" : "Oksykodon"
        }]
      },
      "form" : {
        "coding" : [{
          "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
          "code" : "51",
          "display" : "Mikstur, oppløsning"
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
      "resourceType" : "MedicationAdministration",
      "id" : "Scenario-A-Administrering-Paracetamol",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Scenario-A-Medisin-Paracetamol"
      },
      "subject" : {
        "reference" : "Patient/Scenario-A-Pasient"
      },
      "context" : {
        "reference" : "Encounter/Scenario-A-Episode"
      },
      "effectiveDateTime" : "2025-03-10T08:00:00+01:00",
      "dosage" : {
        "route" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "421521009",
            "display" : "Swallow"
          }]
        },
        "dose" : {
          "value" : 500,
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
  },
  {
    "resource" : {
      "resourceType" : "MedicationAdministration",
      "id" : "Scenario-A-Administrering-Oksykodon",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Scenario-A-Medisin-Oksykodon"
      },
      "subject" : {
        "reference" : "Patient/Scenario-A-Pasient"
      },
      "context" : {
        "reference" : "Encounter/Scenario-A-Episode"
      },
      "effectiveDateTime" : "2025-03-10T08:15:00+01:00",
      "dosage" : {
        "route" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "421521009",
            "display" : "Swallow"
          }]
        },
        "dose" : {
          "value" : 5,
          "unit" : "ml",
          "system" : "http://unitsofmeasure.org",
          "code" : "ml"
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
