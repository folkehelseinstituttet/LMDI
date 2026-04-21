# Organisasjon-Post - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Post**

## Example Organization: Organisasjon-Post



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Post",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "102683"
  }],
  "type" : [{
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.8624",
      "code" : "08",
      "display" : "Post"
    }]
  }],
  "name" : "HMR ÅLE SH Kreft og blodsjukdommar sengepost",
  "partOf" : {
    "reference" : "Organization/Organisasjon-Seksjon"
  }
}

```
