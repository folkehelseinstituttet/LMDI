# Administrering-20 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-20**

## Example MedicationAdministration: Administrering-20



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-20",
  "contained" : [
    {
      "resourceType" : "Medication",
      "id" : "medisin-91171f8e-b615-41ba-881a-87b8e8075611",
      "code" : {
        "coding" : [
          {
            "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
            "code" : "ID_00B35335-0DF7-4C98-8A0A-1148F4599D21",
            "display" : "Botox pulv til inj væske, oppl 50 E"
          }
        ]
      }
    }
  ],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "#medisin-91171f8e-b615-41ba-881a-87b8e8075611"
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "effectiveDateTime" : "2024-05-28",
  "dosage" : {
    "text" : "100 mg",
    "dose" : {
      "value" : 100,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
