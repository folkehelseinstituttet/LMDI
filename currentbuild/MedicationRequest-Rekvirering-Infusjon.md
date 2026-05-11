# Rekvirering-Infusjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Infusjon**

## Example MedicationRequest: Rekvirering-Infusjon

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**Klinisk studie**: false

**status**: Active

**intent**: Original Order

**category**: Inpatient

**reported**: false

**medication**: [Medication Lokalt legemiddel med ketamin, haloperidol, klonidin og midazolam](Medication-Legemiddel-LokaltLegemiddel-FlereIngredienser.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**authoredOn**: 2024-05-31 21:00:01+0200

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#9144900](Practitioner-Helsepersonell-Med-HPR.md)

> **dosageInstruction****asNeeded**: true**route**:intravenøs administrasjonsvei

### DoseAndRates

| | |
| :--- | :--- |
| - | **Rate[x]** |
| * | 2.5 mL(Details: UCUM codemL = 'mL')/1 min(Details: UCUM codemin = 'min') |




## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Infusjon",
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
  "status" : "active",
  "intent" : "original-order",
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
  "reportedBoolean" : false,
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-LokaltLegemiddel-FlereIngredienser"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "authoredOn" : "2024-05-31T21:00:01+02:00",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Med-HPR"
  },
  "dosageInstruction" : [
    {
      "asNeededBoolean" : true,
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
          "rateRatio" : {
            "numerator" : {
              "value" : 2.5,
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
      ]
    }
  ]
}

```
