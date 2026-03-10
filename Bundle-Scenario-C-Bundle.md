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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Patient_Scenario-C-Pasient\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Patient Scenario-C-Pasient</b></p><a name=\"Scenario-C-Pasient\"> </a><a name=\"hcScenario-C-Pasient\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-patient.html\">Pasient</a></p></div><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Anonymous Patient Male, DoB: 1965-07-15 ( urn:oid:2.16.578.1.12.4.1.4.1#15076500565)</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Detail</td><td colspan=\"3\"></td></tr></table></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Practitioner_Scenario-C-Helsepersonell\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Practitioner Scenario-C-Helsepersonell</b></p><a name=\"Scenario-C-Helsepersonell\"> </a><a name=\"hcScenario-C-Helsepersonell\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-practitioner.html\">Helsepersonell</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.4</code>/8877665</p></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Organization_Scenario-C-Organisasjon\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Organization Scenario-C-Organisasjon</b></p><a name=\"Scenario-C-Organisasjon\"> </a><a name=\"hcScenario-C-Organisasjon\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-organization.html\">Organisasjon</a></p></div><p><b>identifier</b>: <code>urn:oid:2.16.578.1.12.4.1.4.102</code>/4201050</p><p><b>name</b>: Onkologisk avdeling, St. Olavs hospital</p><p><b>address</b>: </p></div>"
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
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Encounter_Scenario-C-Episode\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Encounter Scenario-C-Episode</b></p><a name=\"Scenario-C-Episode\"> </a><a name=\"hcScenario-C-Episode\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-encounter.html\">Episode</a></p></div><blockquote><p><b>NPR Episode Identifier</b></p><ul><li>stringIdentifier: NPR-STOL-2025-789</li></ul></blockquote><p><b>status</b>: In Progress</p><p><b>class</b>: <a href=\"http://terminology.hl7.org/7.1.0/CodeSystem-v3-ActCode.html#v3-ActCode-IMP\">ActCode: IMP</a> (inpatient encounter)</p><p><b>serviceProvider</b>: <a href=\"Organization-Scenario-C-Organisasjon.html\">Organization Onkologisk avdeling, St. Olavs hospital</a></p></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Medication_Scenario-C-Medisin\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Medication Scenario-C-Medisin</b></p><a name=\"Scenario-C-Medisin\"> </a><a name=\"hcScenario-C-Medisin\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medication.html\">Legemiddel</a></p></div><p><b>code</b>: <span title=\"Codes:{http://fh.no/fhir/NamingSystem/lokaltVirkemiddel OXA-85-INF}\">Oksaliplatin 85 mg/m2 infusjonsvæske</span></p><p><b>form</b>: <span title=\"Codes:{urn:oid:2.16.578.1.12.4.1.1.7448 9}\">Infusjonsvæske, oppløsning</span></p><h3>Ingredients</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Item[x]</b></td><td><b>IsActive</b></td></tr><tr><td style=\"display: none\">*</td><td><a href=\"Substance-Scenario-C-Virkestoff.html\">Substance Oxaliplatin (substance)</a></td><td>true</td></tr></table></div>"
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
      "text" : {
        "status" : "extensions",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MedicationRequest_Scenario-C-Rekvirering\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationRequest Scenario-C-Rekvirering</b></p><a name=\"Scenario-C-Rekvirering\"> </a><a name=\"hcScenario-C-Rekvirering\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medicationrequest.html\">Legemiddelrekvirering</a></p></div><p><b>Prosentvis doseendring</b>: 80 %<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  code% = '%')</span></p><p><b>Del av behandlingsregime</b>: FOLFOX6</p><p><b>Klinisk studie</b>: true</p><p><b>status</b>: Active</p><p><b>intent</b>: Order</p><p><b>medication</b>: <a href=\"Medication-Scenario-C-Medisin.html\">Medication Oksaliplatin 85 mg/m2 infusjonsvæske</a></p><p><b>subject</b>: <a href=\"Patient-Scenario-C-Pasient.html\">Anonymous Patient Male, DoB: 1965-07-15 ( urn:oid:2.16.578.1.12.4.1.4.1#15076500565)</a></p><p><b>encounter</b>: <a href=\"Encounter-Scenario-C-Episode.html\">Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)</a></p><p><b>authoredOn</b>: 2025-03-10</p><p><b>requester</b>: <a href=\"Practitioner-Scenario-C-Helsepersonell.html\">Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#8877665</a></p></div>"
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
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"MedicationAdministration_Scenario-C-Administrering\"> </a><p class=\"res-header-id\"><b>Generated Narrative: MedicationAdministration Scenario-C-Administrering</b></p><a name=\"Scenario-C-Administrering\"> </a><a name=\"hcScenario-C-Administrering\"> </a><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\"/><p style=\"margin-bottom: 0px\">Profile: <a href=\"StructureDefinition-lmdi-medicationadministration.html\">Legemiddeladministrering</a></p></div><p><b>status</b>: Completed</p><p><b>medication</b>: <a href=\"Medication-Scenario-C-Medisin.html\">Medication Oksaliplatin 85 mg/m2 infusjonsvæske</a></p><p><b>subject</b>: <a href=\"Patient-Scenario-C-Pasient.html\">Anonymous Patient Male, DoB: 1965-07-15 ( urn:oid:2.16.578.1.12.4.1.4.1#15076500565)</a></p><p><b>context</b>: <a href=\"Encounter-Scenario-C-Episode.html\">Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)</a></p><p><b>effective</b>: 2025-03-10 09:00:00+0100 --&gt; 2025-03-10 11:00:00+0100</p><p><b>request</b>: <a href=\"MedicationRequest-Scenario-C-Rekvirering.html\">MedicationRequest: extension = 80 %,FOLFOX6,true; status = active; intent = order; medication[x] = -&gt;Medication Oksaliplatin 85 mg/m2 infusjonsvæske; authoredOn = 2025-03-10</a></p><h3>Dosages</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Route</b></td><td><b>Dose</b></td><td><b>Rate[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:{http://snomed.info/sct 47625008}\">Intravenous route (qualifier value)</span></td><td>170 mg<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codemg = 'mg')</span></td><td>250 ml<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codeml = 'ml')</span>/120 min<span style=\"background: LightGoldenRodYellow\"> (Details: UCUM  codemin = 'min')</span></td></tr></table></div>"
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
