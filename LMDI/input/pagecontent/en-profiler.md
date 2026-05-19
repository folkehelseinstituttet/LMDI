### FHIR profiles

The LMDI implementation guide defines the following FHIR profiles and extensions.

#### Core profiles

| Profile | FHIR base | Description |
|---------|-----------|-------------|
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.html) | Bundle | Bundle profile for Legemiddelregisteret. Supports transaction-type and POST operations only, with restrictions on permitted resource types. The bundle may only contain: Condition, Practitioner, Encounter, Medication, MedicationAdministration, MedicationRequest, Organization, Patient, Substance. |
| [Pasient](StructureDefinition-lmdi-patient.html) | Patient | The patient who has been prescribed or administered medication, based on no-basis-Patient. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.html) | Practitioner | The practitioner who prescribed the medication, based on no-basis-Practitioner. HPR number shall be provided when available. |
| [Organisasjon](StructureDefinition-lmdi-organization.html) | Organization | The institution or organisational unit responsible for medication administration or prescribing. |
| [Episode](StructureDefinition-lmdi-encounter.html) | Encounter | A clinical encounter or care episode, with a focus on organisational affiliation. |
| [Diagnose](StructureDefinition-lmdi-condition.html) | Condition | The diagnosis for which the medication was prescribed or administered. |
| [Legemiddel](StructureDefinition-lmdi-medication.html) | Medication | Description of a medication. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.html) | MedicationAdministration | Describes administration of a medication to a patient in an institutional setting. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | MedicationRequest | Medication request – prescription or other ordering of a medication. |
| [Virkestoff](StructureDefinition-lmdi-substance.html) | Substance | A customised profile of Substance to represent an active substance, based on no-basis. |

#### Extensions

| Extension | Description |
|-----------|-------------|
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.html) | Classification of medications, primarily using ATC codes (Anatomical Therapeutic Chemical classification). |
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.html) | The name of the regimen, treatment protocol, or course the medication is given as part of. Particularly relevant in chemotherapy. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.html) | Indicates whether the medication is given as part of a clinical trial. |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.html) | Unique identifier for the episode as used in reporting to the Norwegian Patient Registry (NPR). Supports both string-based and UUID-based representations. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.html) | Percentage dose adjustment compared to the original dosage. Particularly relevant in chemotherapy. A normal dose, without modification, is 100%. |
