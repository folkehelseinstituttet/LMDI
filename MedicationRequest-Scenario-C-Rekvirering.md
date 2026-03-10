# Scenario-C-Rekvirering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-C-Rekvirering**

## Example MedicationRequest: Scenario-C-Rekvirering

Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

**Prosentvis doseendring**: 80 % (Details: UCUM code% = '%')

**Del av behandlingsregime**: FOLFOX6

**Klinisk studie**: true

**status**: Active

**intent**: Order

**medication**: [Medication Oksaliplatin 85 mg/m2 infusjonsvæske](Medication-Scenario-C-Medisin.md)

**subject**: [Anonymous Patient Male, DoB: 1965-07-15 ( urn:oid:2.16.578.1.12.4.1.4.1#15076500565)](Patient-Scenario-C-Pasient.md)

**encounter**: [Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)](Encounter-Scenario-C-Episode.md)

**authoredOn**: 2025-03-10

**requester**: [Practitioner: identifier = urn:oid:2.16.578.1.12.4.1.4.4#8877665](Practitioner-Scenario-C-Helsepersonell.md)



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Scenario-C-Rekvirering",
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
    "reference" : "Medication/Scenario-C-Medisin"
  },
  "subject" : {
    "reference" : "Patient/Scenario-C-Pasient"
  },
  "encounter" : {
    "reference" : "Encounter/Scenario-C-Episode"
  },
  "authoredOn" : "2025-03-10",
  "requester" : {
    "reference" : "Practitioner/Scenario-C-Helsepersonell"
  }
}

```
