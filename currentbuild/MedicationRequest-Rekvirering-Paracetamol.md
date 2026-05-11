# Rekvirering-Paracetamol - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Paracetamol**

## Example MedicationRequest: Rekvirering-Paracetamol

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**identifier**: `http://example.org/rekvirering-id`/REK123456

**status**: Active

**intent**: Order

**medication**: [Medication Paracet tab 500 mg](Medication-Legemiddel-FestLegemiddelMerkevare.md)

**subject**: [Anonymous Patient Male, DoB: 1958-05-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12705825562)](Patient-Pasient-Med-FNR.md)

**authoredOn**: 2025-01-27

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#9144900](Practitioner-Helsepersonell-Med-HPR.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Paracetamol",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
    ]
  },
  "identifier" : [
    {
      "system" : "http://example.org/rekvirering-id",
      "value" : "REK123456"
    }
  ],
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelMerkevare"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "authoredOn" : "2025-01-27",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Med-HPR"
  }
}

```
