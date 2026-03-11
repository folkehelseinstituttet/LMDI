# Artifacts Summary - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

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
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) | Beskriver administrering av legemiddel til pasient på institusjon.Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering og dose med eventuell administrasjonsvei. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.md) | Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel |
| [Organisasjon](StructureDefinition-lmdi-organization.md) | Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization.Denne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post). For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen.Det er ønskelig at minimum følgende inngår i “organisasjonshierarkiet”:* organisasjonen på lavest mulig nivå (dvs. post, enhet, avdeling eller lignende)
* organisasjonen på høyre nivå 
* sykehus, Helseforetak og Regionalt Helseforetak
* sykehjem, kommune
 
* minst ett organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH)
 |
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
| [Gyldige legemiddelkoder](ValueSet-legemiddel-koder.md) | ValueSet som inneholder koder fra SNOMED CT, FEST, LMR-nummer, varenummer og lokal legemiddelkatalog |
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
| [Administrering-20](MedicationAdministration-Administrering-20.md) | Utfyllende eksempel - contained med minimal medisinreferanse |
| [Administrering-30](MedicationAdministration-Administrering-30.md) | Eksempel med logiske referanser (identifier-baserte) - demonstrerer identifier-referanser |
| [Diagnose-1-ICD10-OID](Condition-Diagnose-1-ICD10-OID.md) | Eksempel på diagnose ICD-10 |
| [Diagnose-2-SNOMED-CT](Condition-Diagnose-2-SNOMED-CT.md) | Eksempel på diagnose SNOMED CT og ICD-10 |
| [Eksempel på LegemiddelregisterBundle med administreringer](Bundle-LegemiddelregisterBundle-1.md) | Eksempel på en batch-bundle som inneholder to legemiddeladministreringer |
| [Episode-1-Sykehus](Encounter-Episode-1-Sykehus.md) | Eksempel på episode i spesialisthelsetjenesten |
| [Helsepersonell-1-HPR-nummer](Practitioner-Helsepersonell-1-HPR-nummer.md) | Eksempel på helsepersonell med HPR-nummer |
| [Helsepersonell-2-Uten-HPR](Practitioner-Helsepersonell-2-Uten-HPR.md) | Eksempel på rekvirent uten HPR-nummer |
| [Medisin-1-LegemiddelDose-Oxycodone](Medication-Medisin-1-LegemiddelDose-Oxycodone.md) | Eksempel på legemiddel |
| [Medisin-2-Paracetamol](Medication-Medisin-2-Paracetamol.md) | Eksempel på legemiddel - Paracetamol - UTKAST |
| [Medisin-3-LegemiddelPakning-Monoket](Medication-Medisin-3-LegemiddelPakning-Monoket.md) | Eksempel på legemiddel - paking |
| [Medisin-4-LokaltLegemiddel](Medication-Medisin-4-LokaltLegemiddel.md) | Eksempel på legemiddel fra lokal legemiddelkatalog |
| [Organisasjon-1-Sykehjem](Organization-Organisasjon-1-Sykehjem.md) | Eksempel på sykehjem i primærhelsetjenesten |
| [Organisasjon-2-Avdeling](Organization-Organisasjon-2-Avdeling.md) | Eksempel på spesialistavdeling |
| [Organisasjon-3-Sykehus](Organization-Organisasjon-3-Sykehus.md) | Eksempel på sykehusorganisasjon |
| [Pasient-1-Uten-FNR](Patient-Pasient-1-Uten-FNR.md) | Eksempel på pasient med kjønn og fødselsdato |
| [Pasient-2-FNR](Patient-Pasient-2-FNR.md) | Eksempel på pasient med fødselsnummer |
| [Rekvirering-1](MedicationRequest-Rekvirering-1.md) | Eksempel på legemiddelrekvirering av Paracet |
| [Rekvirering-2-Kjemoterapi](MedicationRequest-Rekvirering-2-Kjemoterapi.md) | Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie |
| [Scenario A - Sykehjemsadministrering Bundle](Bundle-Scenario-A-Bundle.md) | Komplett Bundle med sykehjemsadministrering, organisasjonshierarki og to administreringer |
| [Scenario B - Rekvirering og administrering Bundle](Bundle-Scenario-B-Bundle.md) | Komplett Bundle med rekvirering, administrering og diagnose |
| [Scenario C - Kjemoterapi Bundle](Bundle-Scenario-C-Bundle.md) | Komplett Bundle med kjemoterapibehandling, lokal legemiddelkatalog og alle extensions |
| [Scenario-A-Administrering-Oksykodon](MedicationAdministration-Scenario-A-Administrering-Oksykodon.md) | Scenario A - Administrering av Oksykodon mikstur |
| [Scenario-A-Administrering-Paracetamol](MedicationAdministration-Scenario-A-Administrering-Paracetamol.md) | Scenario A - Administrering av Paracetamol |
| [Scenario-A-Episode](Encounter-Scenario-A-Episode.md) | Scenario A - Sykehjemsopphold |
| [Scenario-A-Medisin-Oksykodon](Medication-Scenario-A-Medisin-Oksykodon.md) | Scenario A - Oksykodon mikstur 1 mg/ml |
| [Scenario-A-Medisin-Paracetamol](Medication-Scenario-A-Medisin-Paracetamol.md) | Scenario A - Paracetamol 500 mg tablett |
| [Scenario-A-Org-Avdeling](Organization-Scenario-A-Org-Avdeling.md) | Scenario A - Sykehjemsavdeling |
| [Scenario-A-Org-Kommune](Organization-Scenario-A-Org-Kommune.md) | Scenario A - Kommune |
| [Scenario-A-Org-Sykehjem](Organization-Scenario-A-Org-Sykehjem.md) | Scenario A - Sykehjem |
| [Scenario-A-Pasient](Patient-Scenario-A-Pasient.md) | Scenario A - Sykehjemspasient |
| [Scenario-B-Administrering](MedicationAdministration-Scenario-B-Administrering.md) | Scenario B - Administrering av Morfin subkutant |
| [Scenario-B-Diagnose](Condition-Scenario-B-Diagnose.md) | Scenario B - Postoperativ smerte |
| [Scenario-B-Episode](Encounter-Scenario-B-Episode.md) | Scenario B - Sykehusinnleggelse |
| [Scenario-B-Helsepersonell](Practitioner-Scenario-B-Helsepersonell.md) | Scenario B - Rekvirerende lege |
| [Scenario-B-Medisin](Medication-Scenario-B-Medisin.md) | Scenario B - Morfin injeksjonsvæske |
| [Scenario-B-Organisasjon](Organization-Scenario-B-Organisasjon.md) | Scenario B - Sykehus |
| [Scenario-B-Pasient](Patient-Scenario-B-Pasient.md) | Scenario B - Pasient med D-nummer |
| [Scenario-B-Rekvirering](MedicationRequest-Scenario-B-Rekvirering.md) | Scenario B - Rekvirering av Morfin |
| [Scenario-C-Administrering](MedicationAdministration-Scenario-C-Administrering.md) | Scenario C - Infusjon av Oksaliplatin |
| [Scenario-C-Episode](Encounter-Scenario-C-Episode.md) | Scenario C - Kjemoterapibehandling |
| [Scenario-C-Helsepersonell](Practitioner-Scenario-C-Helsepersonell.md) | Scenario C - Onkolog |
| [Scenario-C-Medisin](Medication-Scenario-C-Medisin.md) | Scenario C - Oksaliplatin fra lokal legemiddelkatalog |
| [Scenario-C-Organisasjon](Organization-Scenario-C-Organisasjon.md) | Scenario C - Onkologisk avdeling |
| [Scenario-C-Pasient](Patient-Scenario-C-Pasient.md) | Scenario C - Kreftpasient |
| [Scenario-C-Rekvirering](MedicationRequest-Scenario-C-Rekvirering.md) | Scenario C - FOLFOX6 kjemoterapirekvirering med alle extensions |
| [Scenario-C-Virkestoff](Substance-Scenario-C-Virkestoff.md) | Scenario C - Oksaliplatin virkestoff |
| [Virkestoff-1-Oksykodon](Substance-Virkestoff-1-Oksykodon.md) | Eksempel på virkestoff - Oksykodon |

