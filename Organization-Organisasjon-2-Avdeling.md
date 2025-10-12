# Organisasjon-2-Avdeling - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-2-Avdeling**

## Example Organization: Organisasjon-2-Avdeling

Profile: [Organisasjon](StructureDefinition-lmdi-organization.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.102`/4208723

**name**: Avdeling for epilepsi, poliklinikk

**partOf**: [Organization Oslo universitetssykehus HF](Organization-Organisasjon-3-Sykehus.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-2-Avdeling",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
      "value" : "4208723"
    }
  ],
  "name" : "Avdeling for epilepsi, poliklinikk",
  "partOf" : {
    "reference" : "Organization/Organisasjon-3-Sykehus"
  }
}

```
