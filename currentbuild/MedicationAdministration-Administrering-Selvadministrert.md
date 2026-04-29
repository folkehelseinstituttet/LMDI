# Administrering-Selvadministrert - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [Home](en-index.md)
* [Information Model](en-informasjonsmodell.md)
* [Integration](en-integrasjon.md) 
* [Protocol](en-protokoll.md)
* [SignedEncryptedBundle](en-SignertKryptertBundle.md)
* [C# Example Code](en-eksempelkode_cs.md)
* [PowerShell Example Code](en-eksempelkode_ps1.md)
 
* [FHIR Profiles](en-profiler.md)
* [Downloads](en-nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Selvadministrert**

## Example MedicationAdministration: Administrering-Selvadministrert



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Selvadministrert",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "category" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/medication-admin-category",
      "code" : "community",
      "display" : "Community"
    }]
  },
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Varenummer"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectiveDateTime" : "2025-08-14T10:00:00+02:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
        "code" : "53",
        "display" : "Oral bruk"
      }]
    },
    "dose" : {
      "value" : 10,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
