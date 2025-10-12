# Administrering-10 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-10**

## Example MedicationAdministration: Administrering-10



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-10",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "contained" : [
    {
      "resourceType" : "Medication",
      "id" : "Medisin-10",
      "meta" : {
        "profile" : [
          "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
        ]
      },
      "code" : {
        "coding" : [
          {
            "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
            "code" : "ID_48BD33D2-2838-4B81-8225-02391B7A4516",
            "display" : "Oxycodone Orifarm mikst oppl 1 mg/ml"
          },
          {
            "system" : "http://snomed.info/sct",
            "code" : "414984009",
            "display" : "Product containing oxycodone (medicinal product)"
          }
        ]
      }
    },
    {
      "resourceType" : "Patient",
      "id" : "Pasient-20",
      "meta" : {
        "profile" : [
          "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
        ]
      },
      "identifier" : [
        {
          "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
          "value" : "13031353453"
        }
      ]
    },
    {
      "resourceType" : "Practitioner",
      "id" : "Helsepersonell-10",
      "meta" : {
        "profile" : [
          "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
        ]
      },
      "identifier" : [
        {
          "system" : "urn:oid:2.16.578.1.12.4.1.4.4",
          "value" : "9144900"
        }
      ]
    },
    {
      "resourceType" : "Encounter",
      "id" : "Episode-2-Sykehjem",
      "meta" : {
        "profile" : [
          "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
        ]
      },
      "extension" : [
        {
          "extension" : [
            {
              "url" : "stringIdentifier",
              "valueString" : "NPR123456789"
            },
            {
              "url" : "uuidIdentifier",
              "valueUuid" : "550e8400-e29b-41d4-a716-446655440000"
            }
          ],
          "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
        }
      ],
      "status" : "finished",
      "class" : {
        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActCode",
        "code" : "IMP",
        "display" : "inpatient encounter"
      },
      "serviceProvider" : {
        "reference" : "#Organisasjon-2-Eldrehjem"
      }
    },
    {
      "resourceType" : "Organization",
      "id" : "Organisasjon-2-Eldrehjem",
      "meta" : {
        "profile" : [
          "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
        ]
      },
      "identifier" : [
        {
          "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
          "value" : "1234567890"
        }
      ],
      "type" : [
        {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/organization-type",
              "code" : "prov",
              "display" : "Healthcare Provider"
            }
          ]
        }
      ],
      "name" : "Lykkedalen eldrehjem"
    }
  ],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "#Medisin-10"
  },
  "subject" : {
    "reference" : "#Pasient-20"
  },
  "context" : {
    "reference" : "#Episode-2-Sykehjem"
  },
  "effectiveDateTime" : "2024-05-28T13:14:00Z"
}

```
