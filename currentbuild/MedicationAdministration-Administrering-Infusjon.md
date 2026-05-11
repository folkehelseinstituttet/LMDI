# Administrering-Infusjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Infusjon**

## Example MedicationAdministration: Administrering-Infusjon

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [Medication Lokalt legemiddel med ketamin, haloperidol, klonidin og midazolam](Medication-Legemiddel-LokaltLegemiddel-FlereIngredienser.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**context**: [Encounter: extension = ; identifier = 550e8400-e29b-41d4-a716-446655440000; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Episode-Sykehus.md)

**effective**: 2024-06-13 14:26:01+0200 --> 2024-06-13 14:48:47+0200

**request**: [MedicationRequest: extension = false; status = active; intent = original-order; category = Inpatient; reported[x] = false; medication[x] = ->Medication Lokalt legemiddel med ketamin, haloperidol, klonidin og midazolam; authoredOn = 2024-05-31 21:00:01+0200](MedicationRequest-Rekvirering-Infusjon.md)

### Dosages

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Route** | **Dose** | **Rate[x]** |
| * | intravenøs administrasjonsvei | 80 milliliter(Details: UCUM codemL = 'mL') | 3.6 mL(Details: UCUM codemL = 'mL')/1 min(Details: UCUM codemin = 'min') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Infusjon",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-LokaltLegemiddel-FlereIngredienser"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectivePeriod" : {
    "start" : "2024-06-13T14:26:01+02:00",
    "end" : "2024-06-13T14:48:47+02:00"
  },
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-Infusjon"
  },
  "dosage" : {
    "route" : {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "47625008",
          "display" : "intravenøs administrasjonsvei"
        }
      ]
    },
    "dose" : {
      "value" : 80,
      "unit" : "milliliter",
      "system" : "http://unitsofmeasure.org",
      "code" : "mL"
    },
    "rateRatio" : {
      "numerator" : {
        "value" : 3.6,
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "min"
      }
    }
  }
}

```
