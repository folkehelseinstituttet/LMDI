# Diagnose-ICD10-Multippel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.7

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-ICD10-Multippel**

## Example Condition: Diagnose-ICD10-Multippel



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-ICD10-Multippel",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "735599007",
      "display" : "Rheumatoid arthritis with erosion of joint (disorder)"
    },
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "M06.99",
      "display" : "Uspesifisert revmatoid artritt i uspesifisert lokalisasjon"
    },
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "M24.19",
      "display" : "Andre lidelser i leddbrusk;uspes lokalis"
    }]
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  }
}

```
