# Administrering-Selvadministrert - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Selvadministrert**

## Example MedicationAdministration: Administrering-Selvadministrert

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**category**: Community

**medication**: [Medication Paracet mikst oppl 24 mg/ml](Medication-Legemiddel-Varenummer.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**context**: [Encounter: extension = ; identifier = 550e8400-e29b-41d4-a716-446655440000; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Episode-Sykehus.md)

**effective**: 2025-08-14 10:00:00+0200

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Oral bruk | 10 milligram(Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Selvadministrert",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "status" : "completed",
  "category" : {
    "coding" : [
      {
        "system" : "http://terminology.hl7.org/CodeSystem/medication-admin-category",
        "code" : "community",
        "display" : "Community"
      }
    ]
  },
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Varenummer"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectiveDateTime" : "2025-08-14T10:00:00+02:00",
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
      "value" : 10,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
