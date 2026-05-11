# Rekvirering-Cellegift - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Cellegift**

## Example MedicationRequest: Rekvirering-Cellegift

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**Prosentvis doseendring**: 50 %(Details: UCUM code% = '%')

**Del av behandlingsregime**: B102 Gastro, ECX, Epirubicin, Cisplatin, Xeloda

**identifier**: `http://example.org/rekvirering-id`/46456453321544556324

**status**: Unknown

**intent**: Original Order

**medication**: [Medication Cisplatin](Medication-Lokalt-legemiddel-cellegift.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**authoredOn**: 2026-03-28

**requester**: [Practitioner](Practitioner-Helsepersonell-Uten-HPR.md)

> **dosageInstruction****timing**: Count 5 times, Once per 1 month**route**:intravenøs administrasjonsvei

### DoseAndRates

| | | |
| :--- | :--- | :--- |
| - | **Dose[x]** | **Rate[x]** |
| * | 1025 milligram(Details: UCUM codemg = 'mg') | 12 milligram per minute(Details: UCUM codemg/min = 'mg/min') |




## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Cellegift",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring",
      "valueQuantity" : {
        "value" : 50,
        "unit" : "%",
        "system" : "http://unitsofmeasure.org",
        "code" : "%"
      }
    },
    {
      "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime",
      "valueString" : "B102 Gastro, ECX, Epirubicin, Cisplatin, Xeloda"
    }
  ],
  "identifier" : [
    {
      "system" : "http://example.org/rekvirering-id",
      "value" : "46456453321544556324"
    }
  ],
  "status" : "unknown",
  "intent" : "original-order",
  "medicationReference" : {
    "reference" : "Medication/Lokalt-legemiddel-cellegift"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "authoredOn" : "2026-03-28",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Uten-HPR"
  },
  "dosageInstruction" : [
    {
      "timing" : {
        "repeat" : {
          "count" : 5,
          "frequency" : 1,
          "period" : 1,
          "periodUnit" : "mo"
        }
      },
      "route" : {
        "coding" : [
          {
            "system" : "http://snomed.info/sct",
            "code" : "47625008",
            "display" : "intravenøs administrasjonsvei"
          }
        ]
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 1025,
            "unit" : "milligram",
            "system" : "http://unitsofmeasure.org",
            "code" : "mg"
          },
          "rateQuantity" : {
            "value" : 12,
            "unit" : "milligram per minute",
            "system" : "http://unitsofmeasure.org",
            "code" : "mg/min"
          }
        }
      ]
    }
  ]
}

```
