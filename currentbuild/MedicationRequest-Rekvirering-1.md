# Rekvirering-1 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-1**

## Example MedicationRequest: Rekvirering-1

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.1.reseptid`/REK123456

**status**: Active

**intent**: Order

**medication**: [Medication Paracetamol](Medication-Medisin-2-Paracetamol.md)

**subject**: [Anonymous Patient (no stated gender), DoB Unknown ( urn:oid:2.16.578.1.12.4.1.4.1#13031353453)](Patient-Pasient-2-FNR.md)

**authoredOn**: 2025-01-27

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#9144900](Practitioner-Helsepersonell-1-HPR-nummer.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-1",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    ]
  },
  "identifier" : [
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.1.reseptid",
      "value" : "REK123456"
    }
  ],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Medisin-2-Paracetamol"
  },
  "subject" : {
    "reference" : "Patient/Pasient-2-FNR"
  },
  "authoredOn" : "2025-01-27",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-1-HPR-nummer"
  }
}

```
