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
| [Lokal Legemiddelkatalog Values](ValueSet-LokalLegemiddelkatalogValues.md) | Gyldige verdier for lokal legemiddelkatalog |
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
| [Administrering-2-Infusjon](MedicationAdministration-Administrering-2-Infusjon.md) | Eksempel på administrering av legemiddel - infusjon |
| [Administrering-Contained-Oksykodon-Oral](MedicationAdministration-Administrering-Contained-Oksykodon-Oral.md) | Contained eksempel med oral administrering av oksykodon og tilhørende pasient-, episode- og organisasjonskontekst. |
| [Administrering-LogiskReferanse-Infusjon](MedicationAdministration-Administrering-LogiskReferanse-Infusjon.md) | Eksempel med logisk medikamentreferanse ved infusjon, uten lokal medication-ressurs i meldingen. |
| [Administrering-Minimal-Botox-Intramuskular-Contained](MedicationAdministration-Administrering-Minimal-Botox-Intramuskular-Contained.md) | Minimalt contained eksempel med intramuskulær administrering og kun den nødvendige legemiddelreferansen lokalt i ressursen. |
| [Contained bundle med oksykodonadministrering i sykehjem](Bundle-Bundle-Contained-Oksykodon-Sykehjem.md) | Eksempel på transaction-bundle med contained relaterte ressurser for en enkel sykehjemsadministrering. |
| [Diagnose-1-ICD10-OID](Condition-Diagnose-1-ICD10-OID.md) | Eksempel på diagnose ICD-10 |
| [Diagnose-2-SNOMED-CT](Condition-Diagnose-2-SNOMED-CT.md) | Eksempel på diagnose SNOMED CT og ICD-10 |
| [Endose-Smertebehandling-Administrering](MedicationAdministration-Endose-Smertebehandling-Administrering.md) | Subkutan administrering med både SNOMED- og OID7477-koding av administrasjonsvei. |
| [Endose-Smertebehandling-Diagnose](Condition-Endose-Smertebehandling-Diagnose.md) | Postoperativ smerte kodet med både ICD-10 og SNOMED CT. |
| [Endose-Smertebehandling-Episode](Encounter-Endose-Smertebehandling-Episode.md) | Sykehusinnleggelse for pasient med akutt smertebehov. |
| [Endose-Smertebehandling-Morfin-Endose](Medication-Endose-Smertebehandling-Morfin-Endose.md) | Morfin identifisert med både LMR-løpenummer og varenummer. |
| [Endose-Smertebehandling-Pasient-Dnr](Patient-Endose-Smertebehandling-Pasient-Dnr.md) | Pasient med D-nummer i et innleggelsesscenario for postoperativ smertebehandling. |
| [Endose-Smertebehandling-Rekvirent](Practitioner-Endose-Smertebehandling-Rekvirent.md) | Rekvirerende lege i sykehusscenarioet. |
| [Endose-Smertebehandling-Rekvirering](MedicationRequest-Endose-Smertebehandling-Rekvirering.md) | Rekvirering av morfin ved postoperativ smerte. |
| [Endose-Smertebehandling-Sykehus](Organization-Endose-Smertebehandling-Sykehus.md) | Sykehusorganisasjon der behandling og administrering skjer. |
| [Endosebasert smertebehandling med rekvirering, diagnose og administrering](Bundle-Endose-Smertebehandling-Bundle.md) | Komplett bundle for postoperativ smertebehandling der legemidlet er identifisert med LMR-løpenummer og varenummer. |
| [Episode-1-Sykehus](Encounter-Episode-1-Sykehus.md) | Eksempel på episode i spesialisthelsetjenesten |
| [Fullt kjemoterapiscenario med lokal katalog, forrige rekvirering og aktiv administrering](Bundle-Kjemoterapi-Full-Bundle.md) | Komplett bundle som viser lokal legemiddelkatalog, diagnosekobling, begge NPR-identifikatorer og alle LMDI-extensions for rekvirering. |
| [Helsepersonell-1-HPR-nummer](Practitioner-Helsepersonell-1-HPR-nummer.md) | Eksempel på helsepersonell med HPR-nummer |
| [Helsepersonell-2-Uten-HPR](Practitioner-Helsepersonell-2-Uten-HPR.md) | Eksempel på rekvirent uten HPR-nummer |
| [Kjemoterapi-Full-Administrering](MedicationAdministration-Kjemoterapi-Full-Administrering.md) | Infusjon av lokalregistrert oksaliplatin med request-, diagnose- og hastighetsinformasjon. |
| [Kjemoterapi-Full-Diagnose](Condition-Kjemoterapi-Full-Diagnose.md) | Diagnose knyttet til kjemoterapiregimet. |
| [Kjemoterapi-Full-Episode](Encounter-Kjemoterapi-Full-Episode.md) | Kjemoterapiepisode med både string- og UUID-basert NPR-identifikator. |
| [Kjemoterapi-Full-Forrige-Rekvirering](MedicationRequest-Kjemoterapi-Full-Forrige-Rekvirering.md) | Tidligere rekvirering i samme kurforløp. |
| [Kjemoterapi-Full-Helsepersonell](Practitioner-Kjemoterapi-Full-Helsepersonell.md) | Onkolog som rekvirerer kuren. |
| [Kjemoterapi-Full-Oksaliplatin-LokalKatalog](Medication-Kjemoterapi-Full-Oksaliplatin-LokalKatalog.md) | Lokalregistrert oksaliplatin med ingredient-reference og ATC-klassifisering. |
| [Kjemoterapi-Full-Organisasjon](Organization-Kjemoterapi-Full-Organisasjon.md) | Onkologisk avdeling som gjennomfører kjemoterapien. |
| [Kjemoterapi-Full-Pasient](Patient-Kjemoterapi-Full-Pasient.md) | Kreftpasient med fullere demografisk og geografisk kontekst. |
| [Kjemoterapi-Full-Rekvirering](MedicationRequest-Kjemoterapi-Full-Rekvirering.md) | Aktiv rekvirering i FOLFOX6-regime med alle LMDI-extensions. |
| [Kjemoterapi-Full-Virkestoff](Substance-Kjemoterapi-Full-Virkestoff.md) | Virkestoff for lokalregistrert oksaliplatin. |
| [Legemiddel-LokalKatalog-Kalsiumklorid-Infusjon](Medication-Legemiddel-LokalKatalog-Kalsiumklorid-Infusjon.md) | Eksempel på lokalt registrert legemiddel med ingredient som CodeableConcept. |
| [Medisin-1-LegemiddelDose-Oxycodone](Medication-Medisin-1-LegemiddelDose-Oxycodone.md) | Eksempel på legemiddel |
| [Medisin-2-Paracetamol](Medication-Medisin-2-Paracetamol.md) | Eksempel på legemiddel - Paracetamol |
| [Medisin-3-LegemiddelPakning-Monoket](Medication-Medisin-3-LegemiddelPakning-Monoket.md) | Eksempel på legemiddel - paking |
| [Minimumsrapportering fra sykehjem med to administreringer](Bundle-Sykehjem-Minimum-Bundle.md) | Transaction-bundle med kun nødvendige felter, organisasjonshierarki og to ulike legemiddelslicer. |
| [Organisasjon-1-Sykehjem](Organization-Organisasjon-1-Sykehjem.md) | Eksempel på sykehjem i primærhelsetjenesten |
| [Organisasjon-2-Avdeling](Organization-Organisasjon-2-Avdeling.md) | Eksempel på spesialistavdeling |
| [Organisasjon-3-Sykehus](Organization-Organisasjon-3-Sykehus.md) | Eksempel på sykehusorganisasjon |
| [Pasient-1-Uten-FNR](Patient-Pasient-1-Uten-FNR.md) | Eksempel på pasient med kjønn og fødselsdato |
| [Pasient-2-FNR](Patient-Pasient-2-FNR.md) | Eksempel på pasient med fødselsnummer |
| [Rekvirering-1](MedicationRequest-Rekvirering-1.md) | Eksempel på legemiddelrekvirering av Paracet |
| [Rekvirering-2-Kjemoterapi](MedicationRequest-Rekvirering-2-Kjemoterapi.md) | Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie |
| [Sykehjem-Minimum-Administrering-Oksykodon](MedicationAdministration-Sykehjem-Minimum-Administrering-Oksykodon.md) | Minimumsscenario - administrering av oksykodon som virkestoffidentifisert legemiddel. |
| [Sykehjem-Minimum-Administrering-Paracetamol](MedicationAdministration-Sykehjem-Minimum-Administrering-Paracetamol.md) | Minimumsscenario - tablettadministrering uten valgfri kontekst utover episode. |
| [Sykehjem-Minimum-Avdeling](Organization-Sykehjem-Minimum-Avdeling.md) | Minimumsscenario - avdelingen som administrerer legemidlet. |
| [Sykehjem-Minimum-Episode](Encounter-Sykehjem-Minimum-Episode.md) | Minimumsscenario - pågående sykehjemsopphold. |
| [Sykehjem-Minimum-Kommune](Organization-Sykehjem-Minimum-Kommune.md) | Minimumsscenario - overordnet kommuneorganisasjon. |
| [Sykehjem-Minimum-Oksykodon-Virkestoff](Medication-Sykehjem-Minimum-Oksykodon-Virkestoff.md) | Minimumsscenario - oksykodon identifisert med FEST virkestoff-id. |
| [Sykehjem-Minimum-Paracetamol-Merkevare](Medication-Sykehjem-Minimum-Paracetamol-Merkevare.md) | Minimumsscenario - paracetamol identifisert med FEST merkevare. |
| [Sykehjem-Minimum-Pasient](Patient-Sykehjem-Minimum-Pasient.md) | Minimumsscenario - pasient identifisert med fødselsnummer. |
| [Sykehjem-Minimum-Sykehjem](Organization-Sykehjem-Minimum-Sykehjem.md) | Minimumsscenario - institusjonen som avdelingen tilhører. |
| [Virkestoff-1-Oksykodon](Substance-Virkestoff-1-Oksykodon.md) | Eksempel på virkestoff - Oksykodon |

