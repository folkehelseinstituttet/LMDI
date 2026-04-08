# Artifacts Summary - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

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
| [NPR Episode Identifier](StructureDefinition-npr-episode-identifier.md) | Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren. |
| [Prosentvis doseendring](StructureDefinition-lmdi-prosentvis-doseendring.md) | Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. |

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
| [Administrering-EnteredInError](MedicationAdministration-Administrering-EnteredInError.md) | Eksempel på administrering av legemiddel med status feilregistrert (entered-in-error) |
| [Administrering-Infusjon](MedicationAdministration-Administrering-Infusjon.md) | Eksempel på administrering av legemiddel - infusjon |
| [Administrering-MedDiagnoseICD10](MedicationAdministration-Administrering-MedDiagnoseICD10.md) | Eksempel på administrering av legemiddel med ICD-10-diagnose som indikasjon |
| [Administrering-MedDiagnoseSCT](MedicationAdministration-Administrering-MedDiagnoseSCT.md) | Eksempel på administrering av legemiddel med SNOMED CT-diagnose som indikasjon |
| [Administrering-Oral](MedicationAdministration-Administrering-Oral.md) | Eksempel på administrering av legemiddel |
| [Administrering-Selvadministrert](MedicationAdministration-Administrering-Selvadministrert.md) | Eksempel på selvadministrering — pasienten tar legemidlet selv etter utdeling fra institusjon |
| [Diagnose-ICD10](Condition-Diagnose-ICD10.md) | Eksempel på diagnose ICD-10 |
| [Diagnose-SNOMED-SCT](Condition-Diagnose-SNOMED-SCT.md) | Eksempel på diagnose SNOMED CT |
| [Episode-Sykehjem](Encounter-Episode-Sykehjem.md) | Eksempel på episode på sykehjem |
| [Episode-Sykehus](Encounter-Episode-Sykehus.md) | Eksempel på episode i spesialisthelsetjenesten |
| [Helsepersonell-Med-HPR](Practitioner-Helsepersonell-Med-HPR.md) | Eksempel på helsepersonell med HPR-nummer |
| [Helsepersonell-Uten-HPR](Practitioner-Helsepersonell-Uten-HPR.md) | Eksempel på rekvirent uten HPR-nummer |
| [Legemiddel-FestLegemiddelMerkevare](Medication-Legemiddel-FestLegemiddelMerkevare.md) | Eksempel på legemiddel identifisert med FEST legemiddelmerkevare-id |
| [Legemiddel-FestLegemiddelVirkestoff](Medication-Legemiddel-FestLegemiddelVirkestoff.md) | Eksempel på legemiddel identifisert med FEST legemiddelvirkestoff-id |
| [Legemiddel-FestLegemiddeldose](Medication-Legemiddel-FestLegemiddeldose.md) | Eksempel på legemiddel identifisert med FEST legemiddeldose-id |
| [Legemiddel-FestLegemiddelpakning](Medication-Legemiddel-FestLegemiddelpakning.md) | Eksempel på legemiddel identifisert med FEST legemiddelpakning-id |
| [Legemiddel-FestLmrLopenr](Medication-Legemiddel-FestLmrLopenr.md) | Eksempel på legemiddel identifisert med LMR-løpenummer |
| [Legemiddel-Lokalt-Med-Flere-Ingredienser](Medication-Legemiddel-Lokalt-Med-Flere-Ingredienser.md) | Eksempel på lokalt legemiddel med flere ingredienser |
| [Legemiddel-SCT](Medication-Legemiddel-SCT.md) | Eksempel på legemiddel identifisert med SNOMED CT-kode |
| [Legemiddel-Varenummer](Medication-Legemiddel-Varenummer.md) | Eksempel på legemiddel identifisert med varenummer |
| [Oksykodonadministrering i sykehjem med inline ressurskopier](Bundle-Bundle-Scenario-Sykehjem-Oksykodon.md) | Eksempel på transaction-bundle der medlemsressursene er lokale bundle-instanser merket som inline. |
| [Organisasjon-HF](Organization-Organisasjon-HF.md) | Eksempel på Helseforetak |
| [Organisasjon-HF-2](Organization-Organisasjon-HF-2.md) | Eksempel på Helseforetak (Helse Møre og Romsdal HF) |
| [Organisasjon-Kommune](Organization-Organisasjon-Kommune.md) | Eksempel på kommune i primærhelsetjenesten |
| [Organisasjon-Post](Organization-Organisasjon-Post.md) | Eksempel på post – laveste nivå i organisasjonshierarkiet |
| [Organisasjon-Seksjon](Organization-Organisasjon-Seksjon.md) | Eksempel på seksjonsnivå i organisasjonshierarkiet |
| [Organisasjon-Sykehjem](Organization-Organisasjon-Sykehjem.md) | Eksempel på sykehjem i primærhelsetjenesten |
| [Organisasjon-Sykehus](Organization-Organisasjon-Sykehus.md) | Eksempel på sykehusorganisasjon |
| [Organisasjon-Sykehus-2](Organization-Organisasjon-Sykehus-2.md) | Eksempel på sykehusorganisasjon under Helse Møre og Romsdal HF |
| [Organisasjon-Sykehusavdeling](Organization-Organisasjon-Sykehusavdeling.md) | Eksempel på spesialistavdeling |
| [Pasient-Med-DNR](Patient-Pasient-Med-DNR.md) | Eksempel på pasient med D-nummer |
| [Pasient-Med-FNR](Patient-Pasient-Med-FNR.md) | Eksempel på pasient med fødselsnummer |
| [Pasient-Uten-Personidentifikator](Patient-Pasient-Uten-Personidentifikator.md) | Eksempel på pasient uten personidentifikator |
| [Rekvirering-Infusjon](MedicationRequest-Rekvirering-Infusjon.md) | Eksempel på rekvirering for intravenøs infusjon |
| [Rekvirering-Kjemoterapi](MedicationRequest-Rekvirering-Kjemoterapi.md) | Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie |
| [Rekvirering-Paracetamol](MedicationRequest-Rekvirering-Paracetamol.md) | Eksempel på legemiddelrekvirering av Paracet |
| [Virkestoff-Oksykodon](Substance-Virkestoff-Oksykodon.md) | Eksempel på virkestoff - Oksykodon |

