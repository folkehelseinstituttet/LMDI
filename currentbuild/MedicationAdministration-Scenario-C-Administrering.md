# Scenario-C-Administrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-C-Administrering**

## Example MedicationAdministration: Scenario-C-Administrering

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [Medication Oksaliplatin 85 mg/m2 infusjonsvæske](Medication-Scenario-C-Medisin.md)

**subject**: [Anonymous Patient Male, DoB: 1965-07-15 ( urn:oid:2.16.578.1.12.4.1.4.1#15076500565)](Patient-Scenario-C-Pasient.md)

**context**: [Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)](Encounter-Scenario-C-Episode.md)

**effective**: 2025-03-10 09:00:00+0100 --> 2025-03-10 11:00:00+0100

**request**: [MedicationRequest: extension = 80 %,FOLFOX6,true; status = active; intent = order; medication[x] = ->Medication Oksaliplatin 85 mg/m2 infusjonsvæske; authoredOn = 2025-03-10](MedicationRequest-Scenario-C-Rekvirering.md)

### Dosages

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Route** | **Dose** | **Rate[x]** |
| * | Intravenous route (qualifier value) | 170 mg (Details: UCUM codemg = 'mg') | 250 ml (Details: UCUM codeml = 'ml')/120 min (Details: UCUM codemin = 'min') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Scenario-C-Administrering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
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
}

```
