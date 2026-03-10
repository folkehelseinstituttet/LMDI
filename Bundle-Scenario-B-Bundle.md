# Scenario B - Rekvirering og administrering Bundle - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario B - Rekvirering og administrering Bundle**

## Example Bundle: Scenario B - Rekvirering og administrering Bundle



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "Scenario-B-Bundle",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-bundle"]
  },
  "identifier" : {
    "system" : "urn:oid:2.16.578.1.34.10.3",
    "value" : "scenario-b-bundle-001"
  },
  "type" : "transaction",
  "timestamp" : "2025-03-10T08:00:00+01:00",
  "entry" : [{
    "resource" : {
      "resourceType" : "Patient",
      "id" : "Scenario-B-Pasient",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_Scenario-B-Pasient\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient Scenario-B-Pasient</b></p><a name=\"Scenario-B-Pasient\"> </a><a name=\"hcScenario-B-Pasient\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-patient.html\">Pasient</a></p></div><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Anonymous Patient Female, DoB: 2000-03-12 ( urn:oid:2.16.578.1.12.4.1.4.2#52030078901)</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Detail</td><td colspan=\"3\"></td></tr></table></div>"
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
      "id" : "Scenario-B-Helsepersonell",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Practitioner_Scenario-B-Helsepersonell\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner Scenario-B-Helsepersonell</b></p><a name=\"Scenario-B-Helsepersonell\"> </a><a name=\"hcScenario-B-Helsepersonell\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-practitioner.html\">Helsepersonell</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.4</code>/7654321</p></div>"
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
      "id" : "Scenario-B-Organisasjon",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_Scenario-B-Organisasjon\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization Scenario-B-Organisasjon</b></p><a name=\"Scenario-B-Organisasjon\"> </a><a name=\"hcScenario-B-Organisasjon\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-organization.html\">Organisasjon</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.101</code>/974557746, <code>urn:oid:2.16.578.1.12.4.1.4.102</code>/4204191</p><p><b>name</b>: Haukeland universitetssjukehus</p><p><b>address</b>: </p></div>"
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
      "id" : "Scenario-B-Episode",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Encounter_Scenario-B-Episode\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Encounter Scenario-B-Episode</b></p><a name=\"Scenario-B-Episode\"> </a><a name=\"hcScenario-B-Episode\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-encounter.html\">Episode</a></p></div><blockquote><p><b>NPR Episode Identifier</b></p><ul><li>stringIdentifier: NPR-HUS-2025-4567</li></ul></blockquote><p><b>status</b>: Finished</p><p><b>class</b>: <a href=\"http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP\">ActCode: IMP</a> (inpatient encounter)</p><p><b>serviceProvider</b>: <a href=\"Organization-Scenario-B-Organisasjon.html\">Organization Haukeland universitetssjukehus</a></p></div>"
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
        "reference" : "Organization/Scenario-B-Organisasjon"
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
      "id" : "Scenario-B-Diagnose",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Condition_Scenario-B-Diagnose\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Condition Scenario-B-Diagnose</b></p><a name=\"Scenario-B-Diagnose\"> </a><a name=\"hcScenario-B-Diagnose\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-condition.html\">Diagnose</a></p></div><p><b>code</b>: <span title=\"Codes:{urn:oid:2.16.578.1.12.4.1.1.7110 G89.1}, {http://snomed.info/sct 274663001}\">Akutt smerte</span></p><p><b>subject</b>: <a href=\"Patient-Scenario-B-Pasient.html\">Anonymous Patient Female, DoB: 2000-03-12 ( urn:oid:2.16.578.1.12.4.1.4.2#52030078901)</a></p></div>"
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
        "reference" : "Patient/Scenario-B-Pasient"
      }
    },
    "request" : {
      "method" : "POST",
      "url" : "Condition"
    }
  },
  {
    "resource" : {
      "resourceType" : "Medication",
      "id" : "Scenario-B-Medisin",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      },
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Medication_Scenario-B-Medisin\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Medication Scenario-B-Medisin</b></p><a name=\"Scenario-B-Medisin\"> </a><a name=\"hcScenario-B-Medisin\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medication.html\">Legemiddel</a></p></div><p><b>Legemiddel Classification</b>: <span title=\"Codes:{http://www.whocc.no/atc N02AA01}\">Morfin</span></p><p><b>code</b>: <span title=\"Codes:{http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare ID_81E2A556-B09B-4EC2-BA37-E3A9E3E0F6D0}\">Morfin injeksjonsvæske 10 mg/ml</span></p><p><b>form</b>: <span title=\"Codes:{urn:oid:2.16.578.1.12.4.1.1.7448 11}\">Injeksjonsvæske, oppløsning</span></p></div>"
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
          "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
          "code" : "ID_81E2A556-B09B-4EC2-BA37-E3A9E3E0F6D0",
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
      "id" : "Scenario-B-Rekvirering",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MedicationRequest_Scenario-B-Rekvirering\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationRequest Scenario-B-Rekvirering</b></p><a name=\"Scenario-B-Rekvirering\"> </a><a name=\"hcScenario-B-Rekvirering\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medicationrequest.html\">Legemiddelrekvirering</a></p></div><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>medication</b>: <a href=\"Medication-Scenario-B-Medisin.html\">Medication Morfin injeksjonsvæske 10 mg/ml</a></p><p><b>subject</b>: <a href=\"Patient-Scenario-B-Pasient.html\">Anonymous Patient Female, DoB: 2000-03-12 ( urn:oid:2.16.578.1.12.4.1.4.2#52030078901)</a></p><p><b>encounter</b>: <a href=\"Encounter-Scenario-B-Episode.html\">Encounter: extension = ; status = finished; class = inpatient encounter (ActCode#IMP)</a></p><p><b>authoredOn</b>: 2025-03-09</p><p><b>requester</b>: <a href=\"Practitioner-Scenario-B-Helsepersonell.html\">Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#7654321</a></p><p><b>reasonReference</b>: <a href=\"Condition-Scenario-B-Diagnose.html\">Condition Akutt smerte</a></p></div>"
      },
      "status" : "completed",
      "intent" : "order",
      "medicationReference" : {
        "reference" : "Medication/Scenario-B-Medisin"
      },
      "subject" : {
        "reference" : "Patient/Scenario-B-Pasient"
      },
      "encounter" : {
        "reference" : "Encounter/Scenario-B-Episode"
      },
      "authoredOn" : "2025-03-09",
      "requester" : {
        "reference" : "Practitioner/Scenario-B-Helsepersonell"
      },
      "reasonReference" : [{
        "reference" : "Condition/Scenario-B-Diagnose"
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
      "id" : "Scenario-B-Administrering",
      "meta" : {
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MedicationAdministration_Scenario-B-Administrering\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration Scenario-B-Administrering</b></p><a name=\"Scenario-B-Administrering\"> </a><a name=\"hcScenario-B-Administrering\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medicationadministration.html\">Legemiddeladministrering</a></p></div><p><b>status</b>: Completed</p><p><b>medication</b>: <a href=\"Medication-Scenario-B-Medisin.html\">Medication Morfin injeksjonsvæske 10 mg/ml</a></p><p><b>subject</b>: <a href=\"Patient-Scenario-B-Pasient.html\">Anonymous Patient Female, DoB: 2000-03-12 ( urn:oid:2.16.578.1.12.4.1.4.2#52030078901)</a></p><p><b>context</b>: <a href=\"Encounter-Scenario-B-Episode.html\">Encounter: extension = ; status = finished; class = inpatient encounter (ActCode#IMP)</a></p><p><b>effective</b>: 2025-03-09 22:30:00+0100</p><p><b>reasonReference</b>: <a href=\"Condition-Scenario-B-Diagnose.html\">Condition Akutt smerte</a></p><p><b>request</b>: <a href=\"MedicationRequest-Scenario-B-Rekvirering.html\">MedicationRequest: status = completed; intent = order; medication[x] = -&gt;Medication Morfin injeksjonsvæske 10 mg/ml; authoredOn = 2025-03-09</a></p><h3>Dosages</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Route</b></td><td><b>Dose</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://snomed.info/sct 34206005}\">Subcutaneous route (qualifier value)</span></td><td>5 mg<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codemg = 'mg')</span></td></tr></table></div>"
      },
      "status" : "completed",
      "medicationReference" : {
        "reference" : "Medication/Scenario-B-Medisin"
      },
      "subject" : {
        "reference" : "Patient/Scenario-B-Pasient"
      },
      "context" : {
        "reference" : "Encounter/Scenario-B-Episode"
      },
      "effectiveDateTime" : "2025-03-09T22:30:00+01:00",
      "reasonReference" : [{
        "reference" : "Condition/Scenario-B-Diagnose"
      }],
      "request" : {
        "reference" : "MedicationRequest/Scenario-B-Rekvirering"
      },
      "dosage" : {
        "route" : {
          "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "34206005",
            "display" : "Subcutaneous route (qualifier value)"
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
