### FHIR-profiler

Implementasjonsguiden definerer følgende FHIR-profiler og extensions.

#### Kjerneprofiler

| Profil | FHIR-base | Beskrivelse |
|--------|-----------|-------------|
| [Diagnose](StructureDefinition-lmdi-condition.html) | Condition | Diagnosen pasienten fikk legemiddelrekvirering eller legemiddeladministrering for. |
| [Episode](StructureDefinition-lmdi-encounter.html) | Encounter | Klinisk kontakt eller behandlingsopphold, med vekt på organisatorisk tilknytning. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.html) | Practitioner | Helsepersonell som har rekvirert legemiddelet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når det finnes. |
| [Legemiddel](StructureDefinition-lmdi-medication.html) | Medication | Beskrivelse av et legemiddel. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.html) | MedicationAdministration | Beskriver administrering av et legemiddel til en pasient i institusjon. Dette er kjerneressursen i implementasjonsguiden. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.html) | Bundle | Bundle-profil for Legemiddelregisteret. Støtter kun transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. Bundle kan bare inneholde: Condition, Practitioner, Encounter, Medication, MedicationAdministration, MedicationRequest, Organization, Patient og Substance. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | MedicationRequest | Legemiddelrekvirering, resept, forordning eller annen bestilling av legemiddel. |
| [Organisasjon](StructureDefinition-lmdi-organization.html) | Organization | Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization. |
| [Pasient](StructureDefinition-lmdi-patient.html) | Patient | Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient. |
| [Virkestoff](StructureDefinition-lmdi-substance.html) | Substance | Tilpasset Substance-profil for å representere virkestoff, basert på no-basis-Substance. |

#### Extensions

| Extension | Brukes på | Beskrivelse |
|-----------|----------|-------------|
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Angir om legemidlet gis som en del av en klinisk studie. |
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.html) | [Legemiddel](StructureDefinition-lmdi-medication.html) | Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister). |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.html) | [Episode](StructureDefinition-lmdi-encounter.html) | Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Støtter både string-basert og UUID-basert representasjon. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. |
