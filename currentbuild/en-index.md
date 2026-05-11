# Home - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

* [Home](en-index.md)
* [Information model](en-informasjonsmodell.md)
* [Integration](en-integrasjon.md)
* [FHIR profiles](en-profiler.md)
* [Downloads](en-nedlastinger.md)

* [**Table of Contents**](toc.md)
* **Home**

### Medication data from institutions to the Medication Registry (LMDI)

Complete and up-to-date medication data is available for analysis and research, with the aim of improving quality, governance, health surveillance, preparedness, and knowledge management in the health service.

#### Objective

Collect medication data at the individual level from outpatient and inpatient settings to the Medication Registry (LMR). As part of this effort, an implementation guide (IG) is being developed based on a common information model and HL7 FHIR (this document). This will be used for submitting data from institutions to LMR using data sharing (secured REST API).

The Medication Registry already contains data on dispensed medications from pharmacies at the individual level. The LMDI project now focuses specifically on extending this with data on administered medications from hospitals and other institutions, which will provide a more complete picture of medication use across the entire health service. This is an important extension that will strengthen the foundation for better patient safety, knowledge production, and health surveillance.

Figure: The LMDI project will implement reception of data on administered medications.


#### no-basis dependencies

The LMDI profiles are based on [no-basis](https://hl7.no/fhir/no-basis/) – the Norwegian base profiles for FHIR. no-basis provides standardised profiles adapted to Norwegian conditions, including identifiers, addresses, and code systems.

The following LMDI profiles inherit from no-basis:

* **Practitioner** is based on no-basis-Practitioner (HPR number, Norwegian specialties)
* **Organization** is based on no-basis-Organization (organisation number, RESH ID)
* **Patient** is based on no-basis-Patient (national identity number, D-number, Norwegian addresses)
* **Substance** is based on no-basis-Substance (substance in a Norwegian context)

This provides consistent handling of Norwegian identifiers and code systems across the health sector. To use the LMDI profiles, no-basis (version 2.2.0) must be installed as a dependency.

#### Implementation guide versions

| | | |
| :--- | :--- | :--- |
| 1.1.0 | 2026-04-13 | **Breaking changes:**LokaltLegemiddel uses new URL:`http://fhi.no/fhir/NamingSystem/lokaltLegemiddel`(previously`fh.no/lokaltVirkemiddel`)Medication must have either a code or a substance`organisatoriskNiva`is no longer permitted on OrganizationCondition:`stage.summary`must be populated when`stage`is usedMedicationAdministration: route of administration must be coded with a`code`value**Other changes:**IG status set to activeNew`category`field in MedicationAdministration (including`community`for self-administration)Clarified that`prosentvisDoseendring`100% = unmodified dose`LegemiddelKoder`extended with LMR sequence number, item number, and lokaltLegemiddelPatient: removed redundant address-use invariant;`identifier`definition relaxedConsistent naming of example instances; new examples for condition, infusion, entered-in-error, chemotherapy, self-administration, medication without code, and organisational hierarchy |
| 1.0.8 | 2026-03-10 | Improved FSH examples: fixed validation errors, added missing fields, new scenario-based Bundle examples (nursing home, prescription, chemotherapy)Substance permitted in LegemiddelregisterBundleHarmonised no-basis version in build scriptsCorrected typos and removed outdated comments in profiles |
| 1.0.7 | 2025-09-30 | Removed country field from address in Patient and Organizationaddress.type set to physical in Patient (physical addresses only)Changed municipality extension from propertyInformation to municipalitycode in PatientRemoved citizenship extension from PatientChanged urban district extension from lmdi-urban-district to no-basis urbanDistrict in Organization |
| 1.0.6 | 2025-09-12 | Practitioner, Organization, Patient, and Substance are now based on no-basis |
| 1.0.5 | 2025-07-28 | NPR Episode Identifier extension changed to support both string and UUID simultaneously. Extension is now a complex structure with sub-extensions for stringIdentifier and uuidIdentifier.Added LmrLopenummer and FestVarenummer slices on`Medication.code.coding` |
| 1.0.4 | 2025-05-30 | Medication.code can now be a SNOMED CT code.New Substance profile for the Substance resource.New extension (Must Support) Episode.nprEpisodeIdentifier.New C# example code for authorisation with HelseID. |
| 1.0.3 | 2025-04-11 | Removed MedicationRequest.dosageInstruction.patientInstruction and Medication.text from the profile.New extension: Medication.classification.Added example code in C# and PowerShell |
| 1.0.2 | 2025-04-01 | New extensions added to the MedicationRequest profile: ProsentvisDoseendring, DelAvBehandlingsregime, KliniskStudie |
| 1.0.1 | 2025-02-04 | Changed LegemiddelregisterBundle. Bundle type changed from Batch to Transaction |
| 1.0.0 | 2025-01-15 | First official version. Ready for testing. |

