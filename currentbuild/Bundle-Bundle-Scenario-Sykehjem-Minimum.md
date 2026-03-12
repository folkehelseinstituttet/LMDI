# Minimumsrapportering fra sykehjem med to administreringer - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Minimumsrapportering fra sykehjem med to administreringer**

## Example Bundle: Minimumsrapportering fra sykehjem med to administreringer



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "Bundle-Scenario-Sykehjem-Minimum",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"]
  },
  "identifier" : {
    "system" : "urn:oid:2.16.578.1.34.10.3",
    "value" : "sykehjem-minimum-bundle-001"
  },
  "type" : "transaction",
  "timestamp" : "2025-03-10T09:00:00+01:00",
  "entry" : [{
    "resource" : {
      "resourceType" : "Patient",
      "id" : "Pasient-Scenario-Sykehjem-Minimum-Med-FNR",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
        "value" : "12045678901"
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
      "id" : "Organisasjon-Scenario-Sykehjem-Minimum-Avdeling",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
        "value" : "7100001"
      }],
      "name" : "Avdeling 2B, Soltoppen sykehjem",
      "partOf" : {
        "reference" : "Organization/Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem"
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
      "id" : "Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
        "value" : "987654321"
      }],
      "name" : "Soltoppen sykehjem",
      "partOf" : {
        "reference" : "Organization/Organisasjon-Scenario-Sykehjem-Minimum-Kommune"
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
      "id" : "Organisasjon-Scenario-Sykehjem-Minimum-Kommune",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "identifier" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
        "value" : "938726027"
      }],
      "name" : "Drammen kommune"
    },
    "request" : {
      "method" : "POST",
      "url" : "Organization"
    }
  },
  {
    "resource" : {
      "resourceType" : "Encounter",
      "id" : "Episode-Scenario-Sykehjem-Minimum-Opphold",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      },
      "status" : "in-progress",
      "class" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP",
        "display" : "inpatient encounter"
      },
      "serviceProvider" : {
        "reference" : "Organization/Organisasjon-Scenario-Sykehjem-Minimum-Avdeling"
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
      "id" : "Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "code" : {
        "coding" : [{
          "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
          "code" : "2ABAC272-0BCF-43F0-84BE-984074D92E15",
          "display" : "Paracet tab 500 mg"
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
      "id" : "Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "code" : {
        "coding" : [{
          "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff",
          "code" : "C31AF94A-5D5A-4C91-9B99-BB221E26E4C9",
          "display" : "Oksykodon"
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
      "id" : "Administrering-Scenario-Sykehjem-Minimum-Paracetamol",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare"
      },
      "subject" : {
        "reference" : "Patient/Pasient-Scenario-Sykehjem-Minimum-Med-FNR"
      },
      "context" : {
        "reference" : "Encounter/Episode-Scenario-Sykehjem-Minimum-Opphold"
      },
      "effectiveDateTime" : "2025-03-10T08:00:00+01:00",
      "dosage" : {
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
      "id" : "Administrering-Scenario-Sykehjem-Minimum-Oksykodon",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff"
      },
      "subject" : {
        "reference" : "Patient/Pasient-Scenario-Sykehjem-Minimum-Med-FNR"
      },
      "context" : {
        "reference" : "Encounter/Episode-Scenario-Sykehjem-Minimum-Opphold"
      },
      "effectiveDateTime" : "2025-03-10T08:15:00+01:00",
      "dosage" : {
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
