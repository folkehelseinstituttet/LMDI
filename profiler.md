# FHIR-profiler - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* **FHIR-profiler**

### FHIR-profiler

| | |
| :--- | :--- |
| [Diagnose](StructureDefinition-lmdi-condition.md) | Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for. |
| [Episode](StructureDefinition-lmdi-encounter.md) | Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.md) | Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig. |
| [Legemiddel](StructureDefinition-lmdi-medication.md) | Beskrivelse av legemiddel. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) | Beskriver administrering av legemiddel til pasient på institusjon. Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering, hvem som utførte den (helsepersonell eller rolle ved institusjon) og dose med eventuell administrasjonsvei. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.md) | Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel |
| [Organisasjon](StructureDefinition-lmdi-organization.md) | Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization. Denne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post). For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen. Alle “organisasjonshierarki” skal inkludere minst et organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH). |
| [Pasient](StructureDefinition-lmdi-patient.md) | Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient |
| [Virkestoff](StructureDefinition-lmdi-substance.md) | En tilpasset profil av Substance for å representere virkestoff, basert på no-basis. |

