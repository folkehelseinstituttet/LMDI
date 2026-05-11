### FHIR profiles

> **Note:** Individual profile detail pages are currently only available in Norwegian. English metadata (title, description, element short/definition) is being added progressively to each profile via FHIR translation extensions.

The LMDI implementation guide defines the following FHIR profiles and extensions.

#### Core profiles

| Profile | FHIR base | Description |
|---------|-----------|-------------|
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.html) | Bundle | Bundle profile for the Medication Registry. Supports transaction-type and POST operations only, with restrictions on permitted resource types. The bundle may only contain: Condition, Practitioner, Encounter, Medication, MedicationAdministration, MedicationRequest, Organization, Patient, Substance. |
| [Patient](StructureDefinition-lmdi-patient.html) | Patient | The patient who has been prescribed or administered medication, based on no-basis-Patient. |
| [Practitioner](StructureDefinition-lmdi-practitioner.html) | Practitioner | The practitioner who prescribed the medication, based on no-basis-Practitioner. HPR number shall be provided when available. |
| [Organization](StructureDefinition-lmdi-organization.html) | Organization | The institution or organisational unit responsible for medication administration or prescribing. |
| [Encounter](StructureDefinition-lmdi-encounter.html) | Encounter | A clinical encounter or care episode, with a focus on organisational affiliation. |
| [Condition](StructureDefinition-lmdi-condition.html) | Condition | The diagnosis for which the medication was prescribed or administered. |
| [Medication](StructureDefinition-lmdi-medication.html) | Medication | Description of a medication. |
| [MedicationAdministration](StructureDefinition-lmdi-medicationadministration.html) | MedicationAdministration | Describes administration of a medication to a patient in an institutional setting. |
| [MedicationRequest](StructureDefinition-lmdi-medicationrequest.html) | MedicationRequest | Medication request – prescription or other ordering of a medication. |
| [Substance](StructureDefinition-lmdi-substance.html) | Substance | A customised profile of Substance to represent an active substance, based on no-basis. |

#### Extensions

| Extension | Description |
|-----------|-------------|
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.html) | Classification of medications, primarily using ATC codes (Anatomical Therapeutic Chemical classification). |
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.html) | The name of the regimen, treatment protocol, or course the medication is given as part of. Particularly relevant in chemotherapy. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.html) | Indicates whether the medication is given as part of a clinical trial. |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.html) | Unique identifier for the episode as used in reporting to the Norwegian Patient Registry (NPR). Supports both string-based and UUID-based representations. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.html) | Percentage dose adjustment compared to the original dosage. Particularly relevant in chemotherapy. A normal dose, without modification, is 100%. |
