# Administrering-MedDiagnoseICD10 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-MedDiagnoseICD10**

## Example MedicationAdministration: Administrering-MedDiagnoseICD10

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**identifier**: 71dd991f-2662-4a7e-86b6-c6c85c9580d4

**status**: Completed

**medication**: [Medication Monoket retard depottab 50 mg](Medication-Legemiddel-FestLegemiddelpakning.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**context**: [Encounter: extension = ; identifier = 550e8400-e29b-41d4-a716-446655440000; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Episode-Sykehus.md)

**effective**: 2025-06-13 14:48:47+0200

**reasonReference**: [Condition Angina pectoris](Condition-Diagnose-ICD10.md)

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Oral bruk | 50 milligram(Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-MedDiagnoseICD10",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "identifier" : [
    {
      "value" : "71dd991f-2662-4a7e-86b6-c6c85c9580d4"
    }
  ],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelpakning"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectiveDateTime" : "2025-06-13T14:48:47+02:00",
  "reasonReference" : [
    {
      "reference" : "Condition/Diagnose-ICD10"
    }
  ],
  "dosage" : {
    "route" : {
      "coding" : [
        {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
          "code" : "53",
          "display" : "Oral bruk"
        }
      ]
    },
    "dose" : {
      "value" : 50,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
