# Artifacts Summary - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Diagnose](StructureDefinition-lmdi-condition.md) | Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for. |
| [Episode](StructureDefinition-lmdi-encounter.md) | Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.md) | Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig. |
| [Legemiddel](StructureDefinition-lmdi-medication.md) | Beskrivelse av legemiddel. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) | Beskriver administrering av legemiddel til pasient på institusjon.Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering, hvem som utførte den (helsepersonell eller rolle ved institusjon) og dose med eventuell administrasjonsvei. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.md) | Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel |
| [Organisasjon](StructureDefinition-lmdi-organization.md) | Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization.Denne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post).For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen. Alle “organisasjonshierarki” skal inkludere minst et organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH). |
| [Pasient](StructureDefinition-lmdi-patient.md) | Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient |
| [Virkestoff](StructureDefinition-lmdi-substance.md) | En tilpasset profil av Substance for å representere virkestoff, basert på no-basis. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Del av behandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.md) | Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi. |
| [Klinisk studie](StructureDefinition-lmdi-klinisk-studie.md) | Angir om legemidlet gis som en del av en klinisk studie. |
| [Legemiddel Classification](StructureDefinition-legemiddel-classification.md) | Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister). |
| [NPR Episode Identifier](StructureDefinition-npr-episode-identifier.md) | Entydig identifikator for episode, brukt ved rapportering til NPR. Kan inneholde både string-basert og UUID-basert identifikator. |
| [Prosentvis doseendring](StructureDefinition-lmdi-prosentvis-doseendring.md) | Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ATC Kodesystem ValueSet](ValueSet-atc-valueset.md) | ValueSet som inneholder koder fra WHO ATC (Anatomisk Terapeutisk Kjemisk legemiddelregister) |
| [Gyldige legemiddelkoder](ValueSet-legemiddel-koder.md) | ValueSet som inneholder koder fra SNOMED CT og FEST |
| [Kommunenummer ValueSet](ValueSet-kommunenummer-alle.md) | Komplett kodeverk for norske kommunenummer (Volven 3402) |
| [LMDI Address Type](ValueSet-lmdi-address-type.md) | Tillatt verdi for address.type i LMDI: physical |
| [LMDI Address Use](ValueSet-lmdi-address-use.md) | Tillatte verdier for address.use i LMDI: home, temp, old |
| [Lokal Legemiddelkatalog Values](ValueSet-LokalLegemiddelkatalogValues.md) | Gyldige verdier for medlemskapsstatus |
| [Status for legemiddeladministrering](ValueSet-lmdi-medicationadministrationstatus.md) | Verdisett som begrenses status til Legemiddeladministrering til henholdsvis ‘Gjennomført’ eller ‘Feilregistrert’. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Kommunenummer CodeSystem](CodeSystem-kommunenummer-codesystem.md) | Kodesystem for norske kommunenummer (Volven 3402) |
| [Lokal Legemiddelkatalog Codes](CodeSystem-LokalLegemiddelkatalogCodeSystem.md) | Kodesystem for lokal legemiddelkatalog |

### Terminology: Naming Systems 

These define identifier and/or code system identities used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [lmdi-lokaltLegemiddel](NamingSystem-lmdi-lokaltLegemiddel.md) | Id for angivelse av legemiddel fra lokal legemiddelkatalog |
| [no-basis-fest-legemiddeldose](NamingSystem-no-basis-fest-legemiddeldose.md) | FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett. |
| [no-basis-fest-legemiddelmerkevare](NamingSystem-no-basis-fest-legemiddelmerkevare.md) | FEST-id for legemiddel merkevare. Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare. |
| [no-basis-fest-legemiddelpakning](NamingSystem-no-basis-fest-legemiddelpakning.md) | FEST-id for legemiddelpakninger. Rekvirering av en bestemt pakning av en merkevare (varenummer) |
| [no-basis-fest-legemiddelvirkestoff](NamingSystem-no-basis-fest-legemiddelvirkestoff.md) | FEST-id for virkestoff. Benyttes ved virkestoffrekvirering |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Administrering-1-Oralt](MedicationAdministration-Administrering-1-Oralt.md) | Eksempel på administrering av legemiddel |
| [Administrering-10](MedicationAdministration-Administrering-10.md) | Utfyllende eksempel, f.eks. om alt rapporteres som én melding. Bruker contained - bundle er å foretrekke for melding. |
| [Administrering-2-Infusjon](MedicationAdministration-Administrering-2-Infusjon.md) | Eksempel på administrering av legemiddel - infusjon |
| [Administrering-20](MedicationAdministration-Administrering-20.md) | Utfyllende eksempel - andre referanser |
| [Administrering-30](MedicationAdministration-Administrering-30.md) | Utfyllende eksempel - minimalt, logiske referanser |
| [Diagnose-1-ICD10-OID](Condition-Diagnose-1-ICD10-OID.md) | Eksempel på diagnose ICD-10 |
| [Diagnose-2-SNOMED-CT](Condition-Diagnose-2-SNOMED-CT.md) | Eksempel på diagnose SNOMED CT og ICD-10 |
| [Eksempel på LegemiddelregisterBundle med administreringer](Bundle-LegemiddelregisterBundle-1.md) | Eksempel på en batch-bundle som inneholder to legemiddeladministreringer |
| [Helsepersonell-1-HPR-nummer](Practitioner-Helsepersonell-1-HPR-nummer.md) | Eksempel på helsepersonell med HPR-nummer |
| [Helsepersonell-2-Uten-HPR](Practitioner-Helsepersonell-2-Uten-HPR.md) | Eksempel på rekvirent uten HPR-nummer |
| [Medisin-1-LegemiddelDose-Oxycodone](Medication-Medisin-1-LegemiddelDose-Oxycodone.md) | Eksempel på legemiddel |
| [Medisin-2-Paracetamol](Medication-Medisin-2-Paracetamol.md) | Eksempel på legemiddel - Paracetamol - UTKAST |
| [Medisin-3-LegemiddelPakning-Monoket](Medication-Medisin-3-LegemiddelPakning-Monoket.md) | Eksempel på legemiddel - paking |
| [Organisasjon-1-Sykehjem](Organization-Organisasjon-1-Sykehjem.md) | Eksempel på sykehjem i primærhelsetjenesten |
| [Organisasjon-2-Avdeling](Organization-Organisasjon-2-Avdeling.md) | Eksempel på spesialistavdeling |
| [Organisasjon-3-Sykehus](Organization-Organisasjon-3-Sykehus.md) | Eksempel på sykehusorganisasjon |
| [Pasient-1-Uten-FNR](Patient-Pasient-1-Uten-FNR.md) | Eksempel på pasient med kjønn og fødselsdato |
| [Pasient-2-FNR](Patient-Pasient-2-FNR.md) | Eksempel på pasient med fødselsnummer |
| [Rekvirering-1](MedicationRequest-Rekvirering-1.md) | Eksempel på legemiddelrekvirering av Paracet |
| [eksempel-pasient-1234567890](Patient-eksempel-pasient-1234567890.md) | Eksempel på en pasient |

