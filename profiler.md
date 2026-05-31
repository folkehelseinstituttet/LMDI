# FHIR-profiler - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.1

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* **FHIR-profiler**

### FHIR-profiler

Implementasjonsguiden definerer følgende FHIR-profiler og extensions.

#### Kjerneprofiler

| | | |
| :--- | :--- | :--- |
| [Diagnose](StructureDefinition-lmdi-condition.md) | Condition | Diagnosen pasienten fikk legemiddelrekvirering eller legemiddeladministrering for. |
| [Episode](StructureDefinition-lmdi-encounter.md) | Encounter | Klinisk kontakt eller behandlingsopphold, med vekt på organisatorisk tilknytning. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.md) | Practitioner | Helsepersonell som har rekvirert legemiddelet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når det finnes. |
| [Legemiddel](StructureDefinition-lmdi-medication.md) | Medication | Beskrivelse av et legemiddel. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) | MedicationAdministration | Beskriver administrering av et legemiddel til en pasient i institusjon. Dette er kjerneressursen i implementasjonsguiden. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.md) | Bundle | Bundle-profil for Legemiddelregisteret. Støtter kun transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. Bundle kan bare inneholde: Condition, Practitioner, Encounter, Medication, MedicationAdministration, MedicationRequest, Organization, Patient og Substance. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | MedicationRequest | Legemiddelrekvirering, resept, forordning eller annen bestilling av legemiddel. |
| [Organisasjon](StructureDefinition-lmdi-organization.md) | Organization | Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization. |
| [Pasient](StructureDefinition-lmdi-patient.md) | Patient | Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient. |
| [Virkestoff](StructureDefinition-lmdi-substance.md) | Substance | Tilpasset Substance-profil for å representere virkestoff, basert på no-basis-Substance. |

#### Extensions

| | | |
| :--- | :--- | :--- |
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.md) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.md) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Angir om legemidlet gis som en del av en klinisk studie. |
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.md) | [Legemiddel](StructureDefinition-lmdi-medication.md) | Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister). |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.md) | [Episode](StructureDefinition-lmdi-encounter.md) | Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Støtter både string-basert og UUID-basert representasjon. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.md) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. |

