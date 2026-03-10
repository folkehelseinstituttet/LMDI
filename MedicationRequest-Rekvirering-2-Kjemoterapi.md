# Rekvirering-2-Kjemoterapi - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-2-Kjemoterapi**

## Example MedicationRequest: Rekvirering-2-Kjemoterapi

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**Prosentvis doseendring**: 80 % (Details: UCUM code% = '%')

**Del av behandlingsregime**: FOLFOX6

**Klinisk studie**: true

**status**: Active

**intent**: Order

**medication**: [Medication Oksykodon](Medication-Medisin-1-LegemiddelDose-Oxycodone.md)

**subject**: [Anonymous Patient Male, DoB: 1953-03-13 ( urn:oid:2.16.578.1.12.4.1.4.1#13031353453)](Patient-Pasient-2-FNR.md)

**authoredOn**: 2025-03-10

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#9144900](Practitioner-Helsepersonell-1-HPR-nummer.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-2-Kjemoterapi",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "extension" : [{
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
  }],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Medisin-1-LegemiddelDose-Oxycodone"
  },
  "subject" : {
    "reference" : "Patient/Pasient-2-FNR"
  },
  "authoredOn" : "2025-03-10",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-1-HPR-nummer"
  }
}

```
