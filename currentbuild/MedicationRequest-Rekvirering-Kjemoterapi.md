# Rekvirering-Kjemoterapi - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Kjemoterapi**

## Example MedicationRequest: Rekvirering-Kjemoterapi

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**Prosentvis doseendring**: 80 %(Details: UCUM code% = '%')

**Del av behandlingsregime**: FOLFOX6

**Klinisk studie**: true

**status**: Active

**intent**: Order

**medication**: [Medication Oksykodon mikst oppl 1 mg/ml](Medication-Legemiddel-FestLegemiddelVirkestoff.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**authoredOn**: 2025-03-10

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#9144900](Practitioner-Helsepersonell-Med-HPR.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Kjemoterapi",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    ]
  },
  "extension" : [
    {
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
    }
  ],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelVirkestoff"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "authoredOn" : "2025-03-10",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Med-HPR"
  }
}

```
