# Administrering-Cellegift - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Cellegift**

## Example MedicationAdministration: Administrering-Cellegift

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**identifier**: 15634555315

**status**: Completed

**medication**: [Medication Cisplatin](Medication-Lokalt-legemiddel-cellegift.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**context**: [Encounter: status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Episode-Sykehus-2.md)

**effective**: 2026-04-01 12:12:00+0200 --> 2026-04-01 13:45:00+0200

**request**: [MedicationRequest: extension = 50 %,B102 Gastro, ECX, Epirubicin, Cisplatin, Xeloda; identifier = http://example.org/rekvirering-id#46456453321544556324; status = unknown; intent = original-order; medication[x] = ->Medication Cisplatin; authoredOn = 2026-03-28](MedicationRequest-Rekvirering-Cellegift.md)

### Dosages

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Route** | **Dose** | **Rate[x]** |
| * | intravenøs administrasjonsvei | 1000 milligram(Details: UCUM codemg = 'mg') | 10 mg(Details: UCUM codemg = 'mg')/1 min(Details: UCUM codemin = 'min') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Cellegift",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "identifier" : [
    {
      "value" : "15634555315"
    }
  ],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Lokalt-legemiddel-cellegift"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus-2"
  },
  "effectivePeriod" : {
    "start" : "2026-04-01T12:12:00+02:00",
    "end" : "2026-04-01T13:45:00+02:00"
  },
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-Cellegift"
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
      "value" : 1000,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    },
    "rateRatio" : {
      "numerator" : {
        "value" : 10,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
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
