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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_Scenario-A-Pasient\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient Scenario-A-Pasient</b></p><a name=\"Scenario-A-Pasient\"> </a><a name=\"hcScenario-A-Pasient\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-patient.html\">Pasient</a></p></div><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Anonymous Patient Female, DoB: 1945-04-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12045678901)</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Detail</td><td colspan=\"3\"></td></tr></table></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_Scenario-A-Org-Avdeling\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization Scenario-A-Org-Avdeling</b></p><a name=\"Scenario-A-Org-Avdeling\"> </a><a name=\"hcScenario-A-Org-Avdeling\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-organization.html\">Organisasjon</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.102</code>/7100001</p><p><b>name</b>: Avdeling 2B, Soltoppen sykehjem</p><p><b>partOf</b>: <a href=\"Organization-Scenario-A-Org-Sykehjem.html\">Organization Soltoppen sykehjem</a></p></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_Scenario-A-Org-Sykehjem\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization Scenario-A-Org-Sykehjem</b></p><a name=\"Scenario-A-Org-Sykehjem\"> </a><a name=\"hcScenario-A-Org-Sykehjem\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-organization.html\">Organisasjon</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.101</code>/987654321</p><p><b>name</b>: Soltoppen sykehjem</p><p><b>address</b>: </p><p><b>partOf</b>: <a href=\"Organization-Scenario-A-Org-Kommune.html\">Organization Drammen kommune</a></p></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_Scenario-A-Org-Kommune\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization Scenario-A-Org-Kommune</b></p><a name=\"Scenario-A-Org-Kommune\"> </a><a name=\"hcScenario-A-Org-Kommune\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-organization.html\">Organisasjon</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.101</code>/938726027</p><p><b>name</b>: Drammen kommune</p><p><b>address</b>: </p></div>"
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
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Encounter_Scenario-A-Episode\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Encounter Scenario-A-Episode</b></p><a name=\"Scenario-A-Episode\"> </a><a name=\"hcScenario-A-Episode\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-encounter.html\">Episode</a></p></div><blockquote><p><b>NPR Episode Identifier</b></p><ul><li>stringIdentifier: NPR-SYK-2025-001</li></ul></blockquote><p><b>status</b>: In Progress</p><p><b>class</b>: <a href=\"http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP\">ActCode: IMP</a> (inpatient encounter)</p><p><b>serviceProvider</b>: <a href=\"Organization-Scenario-A-Org-Avdeling.html\">Organization Avdeling 2B, Soltoppen sykehjem</a></p></div>"
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
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Medication_Scenario-A-Medisin-Paracetamol\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Medication Scenario-A-Medisin-Paracetamol</b></p><a name=\"Scenario-A-Medisin-Paracetamol\"> </a><a name=\"hcScenario-A-Medisin-Paracetamol\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medication.html\">Legemiddel</a></p></div><p><b>Legemiddel Classification</b>: <span title=\"Codes:{http://www.whocc.no/atc N02BE01}\">Paracetamol</span></p><p><b>code</b>: <span title=\"Codes:{http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare 2ABAC272-0BCF-43F0-84BE-984074D92E15}\">Paracet tab 500 mg</span></p><p><b>form</b>: <span title=\"Codes:{urn:oid:2.16.578.1.12.4.1.1.7448 1}\">Tablett</span></p></div>"
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
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Medication_Scenario-A-Medisin-Oksykodon\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Medication Scenario-A-Medisin-Oksykodon</b></p><a name=\"Scenario-A-Medisin-Oksykodon\"> </a><a name=\"hcScenario-A-Medisin-Oksykodon\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medication.html\">Legemiddel</a></p></div><p><b>Legemiddel Classification</b>: <span title=\"Codes:{http://www.whocc.no/atc N02AA05}\">Oksykodon</span></p><p><b>code</b>: <span title=\"Codes:{http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff C31AF94A-5D5A-4C91-9B99-BB221E26E4C9}\">Oksykodon</span></p><p><b>form</b>: <span title=\"Codes:{urn:oid:2.16.578.1.12.4.1.1.7448 51}\">Mikstur, oppløsning</span></p></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MedicationAdministration_Scenario-A-Administrering-Paracetamol\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration Scenario-A-Administrering-Paracetamol</b></p><a name=\"Scenario-A-Administrering-Paracetamol\"> </a><a name=\"hcScenario-A-Administrering-Paracetamol\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medicationadministration.html\">Legemiddeladministrering</a></p></div><p><b>status</b>: Completed</p><p><b>medication</b>: <a href=\"Medication-Scenario-A-Medisin-Paracetamol.html\">Medication Paracet tab 500 mg</a></p><p><b>subject</b>: <a href=\"Patient-Scenario-A-Pasient.html\">Anonymous Patient Female, DoB: 1945-04-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12045678901)</a></p><p><b>context</b>: <a href=\"Encounter-Scenario-A-Episode.html\">Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)</a></p><p><b>effective</b>: 2025-03-10 08:00:00+0100</p><h3>Dosages</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Route</b></td><td><b>Dose</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://snomed.info/sct 421521009}\">Swallow</span></td><td>500 mg<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codemg = 'mg')</span></td></tr></table></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MedicationAdministration_Scenario-A-Administrering-Oksykodon\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration Scenario-A-Administrering-Oksykodon</b></p><a name=\"Scenario-A-Administrering-Oksykodon\"> </a><a name=\"hcScenario-A-Administrering-Oksykodon\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medicationadministration.html\">Legemiddeladministrering</a></p></div><p><b>status</b>: Completed</p><p><b>medication</b>: <a href=\"Medication-Scenario-A-Medisin-Oksykodon.html\">Medication Oksykodon</a></p><p><b>subject</b>: <a href=\"Patient-Scenario-A-Pasient.html\">Anonymous Patient Female, DoB: 1945-04-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12045678901)</a></p><p><b>context</b>: <a href=\"Encounter-Scenario-A-Episode.html\">Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)</a></p><p><b>effective</b>: 2025-03-10 08:15:00+0100</p><h3>Dosages</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Route</b></td><td><b>Dose</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://snomed.info/sct 421521009}\">Swallow</span></td><td>5 ml<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codeml = 'ml')</span></td></tr></table></div>"
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
