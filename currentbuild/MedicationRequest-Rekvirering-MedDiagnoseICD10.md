# Rekvirering-MedDiagnoseICD10 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-MedDiagnoseICD10**

## Example MedicationRequest: Rekvirering-MedDiagnoseICD10

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**Klinisk studie**: false

**identifier**: `http://example.org/rekvirering-id`/13fb2660-f88a-473e-b0a9-a72266dc7137

**status**: Active

**intent**: Plan

**category**: Inpatient

**reported**: true

**medication**: [Medication Cetirizin tab 10 mg](Medication-Legemiddel-FestLegemiddelVirkestoff-2.md)

**subject**: [Anonymous Patient (no stated gender), DoB: 1979-01-01 ( urn:oid:2.16.578.1.12.4.1.4.2#41667987421)](Patient-Pasient-Med-DNR.md)

**encounter**: [Encounter: extension = ; identifier = 550e8400-e29b-41d4-a716-446655440000; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Episode-Sykehus.md)

**authoredOn**: 2025-04-15

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#9144900](Practitioner-Helsepersonell-Med-HPR.md)

**reasonReference**: [Condition Vasomotorisk og allergisk rhinitt](Condition-Diagnose-ICD10-Allergi.md)

**courseOfTherapyType**: Seasonal

> **dosageInstruction****timing**: Code**asNeeded**: true

### DoseAndRates

| | |
| :--- | :--- |
| - | **Dose[x]** |
| * | 10 mg(Details: UCUM codemg = 'mg') |




## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-MedDiagnoseICD10",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie",
      "valueBoolean" : false
    }
  ],
  "identifier" : [
    {
      "system" : "http://example.org/rekvirering-id",
      "value" : "13fb2660-f88a-473e-b0a9-a72266dc7137"
    }
  ],
  "status" : "active",
  "intent" : "plan",
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-category",
          "code" : "inpatient"
        }
      ]
    }
  ],
  "reportedBoolean" : true,
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelVirkestoff-2"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-DNR"
  },
  "encounter" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "authoredOn" : "2025-04-15",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Med-HPR"
  },
  "reasonReference" : [
    {
      "reference" : "Condition/Diagnose-ICD10-Allergi"
    }
  ],
  "courseOfTherapyType" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy",
        "code" : "seasonal",
        "display" : "Seasonal"
      }
    ]
  },
  "dosageInstruction" : [
    {
      "timing" : {
        "code" : {
          "coding" : [
            {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.7478",
              "code" : "5685",
              "display" : "1 inntil x1"
            }
          ]
        }
      },
      "asNeededBoolean" : true,
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 10,
            "unit" : "mg",
            "system" : "http://unitsofmeasure.org",
            "code" : "mg"
          }
        }
      ]
    }
  ]
}

```
