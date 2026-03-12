# Oksykodonadministrering i sykehjem med separate ressurser - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Oksykodonadministrering i sykehjem med separate ressurser**

## Example Bundle: Oksykodonadministrering i sykehjem med separate ressurser



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "Bundle-Scenario-Sykehjem-Oksykodon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"]
  },
  "identifier" : {
    "system" : "urn:oid:2.16.578.1.34.10.3",
    "value" : "bundle-001"
  },
  "type" : "transaction",
  "timestamp" : "2024-02-07T13:28:17.239+02:00",
  "entry" : [{
    "resource" : {
      "resourceType" : "Patient",
      "id" : "Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
        "value" : "13031353453"
      }],
      "gender" : "male",
      "birthDate" : "1953-03-13",
      "address" : [{
        "district" : "Oslo",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "0301",
              "display" : "Oslo"
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
      "id" : "Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.4",
        "value" : "9144900"
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
      "id" : "Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
        "value" : "1234567890"
      }],
      "type" : [{
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/organization-type",
          "code" : "prov",
          "display" : "Healthcare Provider"
        }]
      }],
      "name" : "Lykkedalen eldrehjem",
      "address" : [{
        "type" : "physical",
        "district" : "Sigdal",
        "_district" : {
          "extension" : [{
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "3025",
              "display" : "Sigdal"
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
      "id" : "Episode-Scenario-Sykehjem-Oksykodon-Opphold",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      },
      "extension" : [{
        "extension" : [{
          "url" : "stringIdentifier",
          "valueString" : "NPR123456789"
        },
        {
          "url" : "uuidIdentifier",
          "valueUuid" : "550e8400-e29b-41d4-a716-446655440000"
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
        "reference" : "Organization/Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem"
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
      "id" : "Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose",
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
          "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
          "code" : "ID_48BD33D2-2838-4B81-8225-02391B7A4516",
          "display" : "Oxycodone Orifarm mikst oppl 1 mg/ml"
        },
        {
          "system" : "http://snomed.info/sct",
          "code" : "414984009",
          "display" : "Product containing oxycodone (medicinal product)"
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
      "resourceType" : "MedicationRequest",
      "id" : "Rekvirering-Scenario-Sykehjem-Oksykodon-Oral",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
      },
      "status" : "completed",
      "intent" : "order",
      "medicationReference" : {
        "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose"
      },
      "subject" : {
        "reference" : "Patient/Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR"
      },
      "encounter" : {
        "reference" : "Encounter/Episode-Scenario-Sykehjem-Oksykodon-Opphold"
      },
      "authoredOn" : "2024-05-28T12:30:00+02:00",
      "requester" : {
        "reference" : "Practitioner/Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent"
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
      "id" : "Administrering-Scenario-Sykehjem-Oksykodon-Oral",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose"
      },
      "subject" : {
        "reference" : "Patient/Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR"
      },
      "context" : {
        "reference" : "Encounter/Episode-Scenario-Sykehjem-Oksykodon-Opphold"
      },
      "effectiveDateTime" : "2024-05-28T13:14:00+02:00",
      "request" : {
        "reference" : "MedicationRequest/Rekvirering-Scenario-Sykehjem-Oksykodon-Oral"
      },
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
