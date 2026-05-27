# FHIR-profiler - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* **FHIR-profiler**

### FHIR-profiler

| | | |
| :--- | :--- | :--- |
| [Diagnose](StructureDefinition-lmdi-condition.md) | [Condition](http://hl7.org/fhir/R4/condition.html) | Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for. |
| [Episode](StructureDefinition-lmdi-encounter.md) | [Encounter](http://hl7.org/fhir/R4/encounter.html) | En behandlingsepisode som representerer et klinisk møte, konsultasjon, innleggelse eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.md) | [NoBasisPractitioner](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=http://hl7.no/fhir/StructureDefinition/no-basis-Practitioner) | Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig. |
| [Legemiddel](StructureDefinition-lmdi-medication.md) | [Medication](http://hl7.org/fhir/R4/medication.html) | Beskrivelse av legemiddel. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) | [MedicationAdministration](http://hl7.org/fhir/R4/medicationadministration.html) | Beskriver administrering av legemiddel til pasient på institusjon. Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, episoden administreringen skjedde i løpet av (som igjen peker på hvilken institusjon det skjedde ved), rekvireringen administreringen var basert på og årsaken (diagnosen) til at legemidlet ble gitt. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.md) | [Bundle](http://hl7.org/fhir/R4/bundle.html) | Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | [MedicationRequest](http://hl7.org/fhir/R4/medicationrequest.html) | Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel |
| [Organisasjon](StructureDefinition-lmdi-organization.md) | [NoBasisOrganization](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=http://hl7.no/fhir/StructureDefinition/no-basis-Organization) | Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization. |
| [Pasient](StructureDefinition-lmdi-patient.md) | [NoBasisPatient](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=http://hl7.no/fhir/StructureDefinition/no-basis-Patient) | Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient |
| [Virkestoff](StructureDefinition-lmdi-substance.md) | [NoBasisSubstance](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=http://hl7.no/fhir/StructureDefinition/no-basis-Substance) | En tilpasset profil av Substance for å representere virkestoff, basert på no-basis-Substance. |

#### Extensions

| | | |
| :--- | :--- | :--- |
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.md) | [Legemiddel](StructureDefinition-lmdi-medication.md) | Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister). |
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.md) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.md) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Angir om legemidlet gis som en del av en klinisk studie. |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.md) | [Episode](StructureDefinition-lmdi-encounter.md) | Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Støtter både string-basert og UUID-basert representasjon. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.md) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md) | Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. |

