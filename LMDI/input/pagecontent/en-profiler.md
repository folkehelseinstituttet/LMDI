### FHIR profiles

The LMDI implementation guide defines the following FHIR profiles and extensions.

#### Core profiles

| Profile | FHIR base | Description |
|---------|-----------|-------------|
| LegemiddelregisterBundle | Bundle | Bundle profile for the Medication Registry. Supports transaction-type and POST operations only, with restrictions on permitted resource types. The bundle may only contain: Condition, Practitioner, Encounter, Medication, MedicationAdministration, MedicationRequest, Organization, Patient, Substance. |
| Patient | Patient | The patient who has been prescribed or administered medication, based on no-basis-Patient. |
| Practitioner | Practitioner | The practitioner who prescribed the medication, based on no-basis-Practitioner. HPR number shall be provided when available. |
| Organization | Organization | The institution or organisational unit responsible for medication administration or prescribing. |
| Encounter | Encounter | A clinical encounter or care episode, with a focus on organisational affiliation. |
| Condition | Condition | The diagnosis for which the medication was prescribed or administered. |
| Medication | Medication | Description of a medication. |
| MedicationAdministration | MedicationAdministration | Describes administration of a medication to a patient in an institutional setting. |
| MedicationRequest | MedicationRequest | Medication request – prescription or other ordering of a medication. |
| Substance | Substance | A customised profile of Substance to represent an active substance, based on no-basis. |

#### Extensions

| Extension | Description |
|-----------|-------------|
| LegemiddelClassification | Classification of medications, primarily using ATC codes (Anatomical Therapeutic Chemical classification). |
| DelAvBehandlingsregime | The name of the regimen, treatment protocol, or course the medication is given as part of. Particularly relevant in chemotherapy. |
| KliniskStudie | Indicates whether the medication is given as part of a clinical trial. |
| NprEpisodeIdentifier | Unique identifier for the episode as used in reporting to the Norwegian Patient Registry (NPR). Supports both string-based and UUID-based representations. |
| ProsentvisDoseendring | Percentage dose adjustment compared to the original dosage. Particularly relevant in chemotherapy. A normal dose, without modification, is 100%. |
