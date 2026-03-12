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
| [Administrering-Eksempel-Botox-Intramuskular](MedicationAdministration-Administrering-Eksempel-Botox-Intramuskular.md) | Eksempel med intramuskular administrering av Botox og legemiddelreferanse med FEST paknings-id. |
| [Administrering-Eksempel-Infusjon](MedicationAdministration-Administrering-Eksempel-Infusjon.md) | Eksempel på administrering av legemiddel - infusjon |
| [Administrering-Eksempel-LogiskReferanse-Infusjon](MedicationAdministration-Administrering-Eksempel-LogiskReferanse-Infusjon.md) | Eksempel med logisk medikamentreferanse ved infusjon, uten lokal medication-ressurs i meldingen. |
| [Administrering-Eksempel-Oral](MedicationAdministration-Administrering-Eksempel-Oral.md) | Eksempel på administrering av legemiddel |
| [Administrering-Scenario-Kjemoterapi-Full-Oksaliplatin](MedicationAdministration-Administrering-Scenario-Kjemoterapi-Full-Oksaliplatin.md) | Infusjon av lokalregistrert oksaliplatin med request-, diagnose- og hastighetsinformasjon. |
| [Administrering-Scenario-Smertebehandling-Morfin](MedicationAdministration-Administrering-Scenario-Smertebehandling-Morfin.md) | Subkutan administrering med både SNOMED- og OID7477-koding av administrasjonsvei. |
| [Administrering-Scenario-Sykehjem-Minimum-Oksykodon](MedicationAdministration-Administrering-Scenario-Sykehjem-Minimum-Oksykodon.md) | Minimumsscenario - administrering av oksykodon som virkestoffidentifisert legemiddel. |
| [Administrering-Scenario-Sykehjem-Minimum-Paracetamol](MedicationAdministration-Administrering-Scenario-Sykehjem-Minimum-Paracetamol.md) | Minimumsscenario - tablettadministrering uten valgfri kontekst utover episode. |
| [Administrering-Scenario-Sykehjem-Oksykodon-Oral](MedicationAdministration-Administrering-Scenario-Sykehjem-Oksykodon-Oral.md) | Oral administrering av oksykodon med referanser til egne relaterte ressurser. |
| [Diagnose-Eksempel-ICD10](Condition-Diagnose-Eksempel-ICD10.md) | Eksempel på diagnose ICD-10 |
| [Diagnose-Eksempel-SNOMED-CT](Condition-Diagnose-Eksempel-SNOMED-CT.md) | Eksempel på diagnose SNOMED CT og ICD-10 |
| [Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose](Condition-Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose.md) | Diagnose knyttet til kjemoterapiregimet. |
| [Diagnose-Scenario-Smertebehandling-Postoperativ-Smerte](Condition-Diagnose-Scenario-Smertebehandling-Postoperativ-Smerte.md) | Postoperativ smerte kodet med både ICD-10 og SNOMED CT. |
| [Endosebasert smertebehandling med rekvirering, diagnose og administrering](Bundle-Bundle-Scenario-Smertebehandling.md) | Komplett bundle for postoperativ smertebehandling der legemidlet er identifisert med LMR-løpenummer og varenummer. |
| [Episode-Eksempel-Sykehus](Encounter-Episode-Eksempel-Sykehus.md) | Eksempel på episode i spesialisthelsetjenesten |
| [Episode-Scenario-Kjemoterapi-Full-Innleggelse](Encounter-Episode-Scenario-Kjemoterapi-Full-Innleggelse.md) | Kjemoterapiepisode med både string- og UUID-basert NPR-identifikator. |
| [Episode-Scenario-Smertebehandling-Innleggelse](Encounter-Episode-Scenario-Smertebehandling-Innleggelse.md) | Sykehusinnleggelse for pasient med akutt smertebehov. |
| [Episode-Scenario-Sykehjem-Minimum-Opphold](Encounter-Episode-Scenario-Sykehjem-Minimum-Opphold.md) | Minimumsscenario - pågående sykehjemsopphold. |
| [Episode-Scenario-Sykehjem-Oksykodon-Opphold](Encounter-Episode-Scenario-Sykehjem-Oksykodon-Opphold.md) | Sykehjemsopphold med både NPR string- og UUID-identifikator. |
| [Fullt kjemoterapiscenario med lokal katalog, forrige rekvirering og aktiv administrering](Bundle-Bundle-Scenario-Kjemoterapi-Full.md) | Komplett bundle som viser lokal legemiddelkatalog, diagnosekobling, begge NPR-identifikatorer og alle LMDI-extensions for rekvirering. |
| [Helsepersonell-Eksempel-Med-HPR](Practitioner-Helsepersonell-Eksempel-Med-HPR.md) | Eksempel på helsepersonell med HPR-nummer |
| [Helsepersonell-Eksempel-Uten-HPR](Practitioner-Helsepersonell-Eksempel-Uten-HPR.md) | Eksempel på rekvirent uten HPR-nummer |
| [Helsepersonell-Scenario-Kjemoterapi-Full-Rekvirent](Practitioner-Helsepersonell-Scenario-Kjemoterapi-Full-Rekvirent.md) | Onkolog som rekvirerer kuren. |
| [Helsepersonell-Scenario-Smertebehandling-Rekvirent](Practitioner-Helsepersonell-Scenario-Smertebehandling-Rekvirent.md) | Rekvirerende lege i sykehusscenarioet. |
| [Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent](Practitioner-Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent.md) | Rekvirent i sykehjemsscenarioet, identifisert med HPR-nummer. |
| [Legemiddel-Eksempel-Botox-FEST-Pakning](Medication-Legemiddel-Eksempel-Botox-FEST-Pakning.md) | Legemiddel med FEST paknings-id og varenummer. |
| [Legemiddel-Eksempel-LokalKatalog-Kalsiumklorid-Infusjon](Medication-Legemiddel-Eksempel-LokalKatalog-Kalsiumklorid-Infusjon.md) | Eksempel på lokalt registrert legemiddel med ingredient som CodeableConcept. |
| [Legemiddel-Eksempel-Monoket-FEST-Pakning](Medication-Legemiddel-Eksempel-Monoket-FEST-Pakning.md) | Eksempel på legemiddel - paking |
| [Legemiddel-Eksempel-Oksykodon-FEST-Virkestoff](Medication-Legemiddel-Eksempel-Oksykodon-FEST-Virkestoff.md) | Eksempel på legemiddel |
| [Legemiddel-Eksempel-Paracetamol-FEST-Merkevare](Medication-Legemiddel-Eksempel-Paracetamol-FEST-Merkevare.md) | Eksempel på legemiddel - Paracetamol |
| [Legemiddel-Scenario-Kjemoterapi-Full-Oksaliplatin-LokalKatalog](Medication-Legemiddel-Scenario-Kjemoterapi-Full-Oksaliplatin-LokalKatalog.md) | Lokalregistrert oksaliplatin med ingredient-reference og ATC-klassifisering. |
| [Legemiddel-Scenario-Smertebehandling-Morfin-Endose](Medication-Legemiddel-Scenario-Smertebehandling-Morfin-Endose.md) | Morfin identifisert med både LMR-løpenummer og varenummer. |
| [Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff](Medication-Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff.md) | Minimumsscenario - oksykodon identifisert med FEST virkestoff-id. |
| [Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare](Medication-Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare.md) | Minimumsscenario - paracetamol identifisert med FEST merkevare. |
| [Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose](Medication-Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose.md) | Legemiddel med FEST dose-id og SNOMED-koding. |
| [Minimumsrapportering fra sykehjem med to administreringer](Bundle-Bundle-Scenario-Sykehjem-Minimum.md) | Transaction-bundle med kun nødvendige felter, organisasjonshierarki og to ulike legemiddelslicer. |
| [Oksykodonadministrering i sykehjem med separate ressurser](Bundle-Bundle-Scenario-Sykehjem-Oksykodon.md) | Eksempel på transaction-bundle der relaterte ressurser sendes som egne bundle entries. |
| [Organisasjon-Eksempel-Avdeling](Organization-Organisasjon-Eksempel-Avdeling.md) | Eksempel på spesialistavdeling |
| [Organisasjon-Eksempel-Sykehjem](Organization-Organisasjon-Eksempel-Sykehjem.md) | Eksempel på sykehjem i primærhelsetjenesten |
| [Organisasjon-Eksempel-Sykehus](Organization-Organisasjon-Eksempel-Sykehus.md) | Eksempel på sykehusorganisasjon |
| [Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling](Organization-Organisasjon-Scenario-Kjemoterapi-Full-Onkologisk-Avdeling.md) | Onkologisk avdeling som gjennomfører kjemoterapien. |
| [Organisasjon-Scenario-Smertebehandling-Sykehus](Organization-Organisasjon-Scenario-Smertebehandling-Sykehus.md) | Sykehusorganisasjon der behandling og administrering skjer. |
| [Organisasjon-Scenario-Sykehjem-Minimum-Avdeling](Organization-Organisasjon-Scenario-Sykehjem-Minimum-Avdeling.md) | Minimumsscenario - avdelingen som administrerer legemidlet. |
| [Organisasjon-Scenario-Sykehjem-Minimum-Kommune](Organization-Organisasjon-Scenario-Sykehjem-Minimum-Kommune.md) | Minimumsscenario - overordnet kommuneorganisasjon. |
| [Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem](Organization-Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem.md) | Minimumsscenario - institusjonen som avdelingen tilhører. |
| [Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem](Organization-Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem.md) | Sykehjemsorganisasjon fra primærhelsetjenesten. |
| [Pasient-Eksempel-Med-FNR](Patient-Pasient-Eksempel-Med-FNR.md) | Eksempel på pasient med fødselsnummer |
| [Pasient-Eksempel-Uten-FNR](Patient-Pasient-Eksempel-Uten-FNR.md) | Eksempel på pasient med kjønn og fødselsdato |
| [Pasient-Scenario-Kjemoterapi-Full-Med-FNR](Patient-Pasient-Scenario-Kjemoterapi-Full-Med-FNR.md) | Kreftpasient med fullere demografisk og geografisk kontekst. |
| [Pasient-Scenario-Smertebehandling-Med-DNR](Patient-Pasient-Scenario-Smertebehandling-Med-DNR.md) | Pasient med D-nummer i et innleggelsesscenario for postoperativ smertebehandling. |
| [Pasient-Scenario-Sykehjem-Minimum-Med-FNR](Patient-Pasient-Scenario-Sykehjem-Minimum-Med-FNR.md) | Minimumsscenario - pasient identifisert med fødselsnummer. |
| [Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR](Patient-Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR.md) | Pasient med fødselsnummer i et enkelt sykehjemsscenario. |
| [Rekvirering-Eksempel-Kjemoterapi](MedicationRequest-Rekvirering-Eksempel-Kjemoterapi.md) | Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie |
| [Rekvirering-Eksempel-Paracetamol](MedicationRequest-Rekvirering-Eksempel-Paracetamol.md) | Eksempel på legemiddelrekvirering av Paracet |
| [Rekvirering-Scenario-Kjemoterapi-Full-Forrige](MedicationRequest-Rekvirering-Scenario-Kjemoterapi-Full-Forrige.md) | Tidligere rekvirering i samme kurforløp. |
| [Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende](MedicationRequest-Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende.md) | Aktiv rekvirering i FOLFOX6-regime med alle LMDI-extensions. |
| [Rekvirering-Scenario-Smertebehandling-Morfin](MedicationRequest-Rekvirering-Scenario-Smertebehandling-Morfin.md) | Rekvirering av morfin ved postoperativ smerte. |
| [Rekvirering-Scenario-Sykehjem-Oksykodon-Oral](MedicationRequest-Rekvirering-Scenario-Sykehjem-Oksykodon-Oral.md) | Rekvirering av oksykodon i sykehjemsscenarioet. |
| [Virkestoff-Eksempel-Oksykodon](Substance-Virkestoff-Eksempel-Oksykodon.md) | Eksempel på virkestoff - Oksykodon |
| [Virkestoff-Scenario-Kjemoterapi-Full-Oksaliplatin](Substance-Virkestoff-Scenario-Kjemoterapi-Full-Oksaliplatin.md) | Virkestoff for lokalregistrert oksaliplatin. |

