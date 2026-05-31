### FHIR profiles

The LMDI implementation guide defines the following FHIR profiles and extensions.

#### Core profiles

| Profile | FHIR base | Description |
|---------|-----------|-------------|
| [Diagnose](StructureDefinition-lmdi-condition.html) | Condition | The diagnosis for which the medication was prescribed or administered. |
| [Episode](StructureDefinition-lmdi-encounter.html) | Encounter | A clinical encounter or care episode, with a focus on organisational affiliation. |
| [Helsepersonell](StructureDefinition-lmdi-practitioner.html) | Practitioner | The practitioner who prescribed the medication, based on no-basis-Practitioner. HPR number shall be provided when available. |
| [Legemiddel](StructureDefinition-lmdi-medication.html) | Medication | Description of a medication. |
| [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.html) | MedicationAdministration | Describes the administration of a medicinal product to a patient in an institution. This is the core resource for this implementation guide. It references the medicinal product that was administered, the patient who received the administration, the episode during which the administration took place, which in turn references the institution where it occurred, the prescription/order on which the administration was based, and the reason, diagnosis, for which the medicinal product was given. |
| [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.html) | Bundle | Bundle profile for Legemiddelregisteret. Supports transaction-type and POST operations only, with restrictions on permitted resource types. The bundle may only contain: Condition, Practitioner, Encounter, Medication, MedicationAdministration, MedicationRequest, Organization, Patient, Substance. |
| [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | MedicationRequest | Medication request – prescription, ordering or other request of medication. |
| [Organisasjon](StructureDefinition-lmdi-organization.html) | Organization | Organizations in the Norwegian health and care service, such as ward, department, clinic, hospital and nursing home. Based on no-basis-Organization. |
| [Pasient](StructureDefinition-lmdi-patient.html) | Patient | The patient who has been prescribed or administered medication, based on no-basis-Patient. |
| [Virkestoff](StructureDefinition-lmdi-substance.html) | Substance | A customised profile of Substance to represent an active substance, based on no-basis-Substance. |

#### Extensions

| Extension | Used on | Description |
|-----------|---------|-------------|
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | The name of the regimen, treatment protocol, or course the medication is given as part of. Particularly relevant in chemotherapy. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Indicates whether the medication is given as part of a clinical trial. |
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.html) | [Legemiddel](StructureDefinition-lmdi-medication.html) | Classification of medications, primarily using ATC codes (Anatomical Therapeutic Chemical classification). |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.html) | [Episode](StructureDefinition-lmdi-encounter.html) | Unique identifier for the episode as used in reporting to the Norwegian Patient Registry (NPR). Supports both string-based and UUID-based representations. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Percentage dose adjustment compared to the original dosage. Particularly relevant in chemotherapy. A normal dose, without modification, is 100%. |
