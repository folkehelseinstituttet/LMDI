# Administrering-MedDiagnoseSCT - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-MedDiagnoseSCT**

## Example MedicationAdministration: Administrering-MedDiagnoseSCT

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [Medication Paracet mikst oppl 24 mg/ml](Medication-Legemiddel-Varenummer.md)

**subject**: [Anonymous Patient (no stated gender), DoB: 1979-01-01 ( urn:oid:2.16.578.1.12.4.1.4.2#41667987421)](Patient-Pasient-Med-DNR.md)

**context**: [Encounter: extension = ; identifier = 550e8400-e29b-41d4-a716-446655440000; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Episode-Sykehus.md)

**effective**: 2025-07-13 14:48:47+0200

**reasonReference**: [Condition Artrose](Condition-Diagnose-SNOMED-SCT.md)

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Oral bruk | 750 milligram(Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-MedDiagnoseSCT",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Varenummer"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-DNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectiveDateTime" : "2025-07-13T14:48:47+02:00",
  "reasonReference" : [
    {
      "reference" : "Condition/Diagnose-SNOMED-SCT"
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
      "value" : 750,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
