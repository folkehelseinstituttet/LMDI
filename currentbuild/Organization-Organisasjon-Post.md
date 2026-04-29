# Organisasjon-Post - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

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
