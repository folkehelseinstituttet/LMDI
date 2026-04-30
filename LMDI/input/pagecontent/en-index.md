
### Medication Data from Institutions to the Norwegian Medication Registry (LMDI)

Complete and up-to-date health data on medications are available for analysis and research to improve quality, governance, health surveillance, emergency preparedness, and knowledge management in healthcare.

#### Objective

Collect individual-level medication data from outpatient and inpatient care in institutions and submit it to the Norwegian Medication Registry (LMR). As part of this work, an implementation guide (IG) based on a shared information model and HL7 FHIR (this document) is being developed. It is used for secure data transfer from institutions to LMR through a REST API.

The Medication Registry already contains data on dispensed medications from pharmacies at the individual level. The LMDI project now specifically focuses on extending this with data on administered medications from hospitals and other institutions, providing a more complete picture of medication use across the entire healthcare system. This is an important extension that will strengthen the foundation for better patient safety, knowledge production, and health surveillance.

<figure>
    <img src="../lmdi-2.png" width="49%" style="border: 1px solid rgba(0, 0, 0, 0.2); border-radius: 10px; padding: 5px;">
    <figcaption style="font-style: italic; font-size: 14px; margin-top: 5px;">
        Figure: The LMDI project will implement reception of data on administered medications.
    </figcaption>
</figure>
<br clear="all"/>

#### no-basis dependencies

The LMDI profiles are based on [no-basis](https://hl7.no/fhir/no-basis/) – the Norwegian base profiles for FHIR. no-basis provides standardized profiles adapted to Norwegian conditions, including identifiers, addresses, and code systems.

The following LMDI profiles inherit from no-basis:
- **Healthcare professional** is based on no-basis-Practitioner (HPR number, Norwegian specialties)
- **Organization** is based on no-basis-Organization (organization number, RESH-ID)
- **Patient** is based on no-basis-Patient (national identity number, D-number, Norwegian addresses)
- **Substance** is based on no-basis-Substance (active ingredients in a Norwegian context)

This ensures consistent handling of Norwegian identifiers and code systems across the health sector. To use the LMDI profiles, no-basis (version 2.2.0) must be installed as a dependency.

#### Implementation guide versions

| Version | Date | Description |
|---------|------|-------------|
| 1.1.0 | 2026-04-13 | **Breaking changes:**<br/>LokaltLegemiddel uses new URL: `http://fhi.no/fhir/NamingSystem/lokaltLegemiddel` (previously `fh.no/lokaltVirkemiddel`)<br/>Medication must have either a code or an active ingredient<br/>`organisatoriskNiva` is no longer allowed on Organization<br/>Condition: `stage.summary` must be filled in when `stage` is used<br/>MedicationAdministration: route of administration must be coded with a `code` value<br/>**Other changes:**<br/>IG status set to active<br/>New `category` field in MedicationAdministration (including `community` for self-administration)<br/>Clarified that `prosentvisDoseendring` 100% = unmodified dose<br/>`LegemiddelKoder` extended with LMR serial number, item number and lokaltLegemiddel<br/>Patient: removed redundant address-use constraint; `identifier` definition relaxed<br/>Consistent naming of example instances; new examples for condition, infusion, entered-in-error, chemotherapy, self-administration, medication without code and organization hierarchy |
| 1.0.8 | 2026-03-10 | Improved FSH examples: fixed validation errors, added missing fields, new scenario-based Bundle examples (nursing home, prescription, chemotherapy)<br/>Substance allowed in LegemiddelregisterBundle<br/>Harmonized no-basis version in build scripts<br/>Fixed typos and removed outdated comments in profiles |
| 1.0.7 | 2025-09-30 | Removed country field from address in Patient and Organization<br/>address.type set to physical in Patient (physical addresses only)<br/>Changed municipality extension from propertyInformation to municipalitycode in Patient<br/>Removed citizenship extension from Patient<br/>Changed urban district extension from lmdi-urban-district to no-basis urbanDistrict in Organization |
| 1.0.6 | 2025-09-12 | Healthcare professional, Organization, Patient and Substance are now based on no-basis<br/> |
| 1.0.5 | 2025-07-28 | NPR Episode Identifier extension changed to support both string and UUID simultaneously. Extension is now a complex structure with sub-extensions for stringIdentifier and uuidIdentifier.<br/>Added LmrLopenummer and FestVarenummer slices to `Medication.code.coding` |
| 1.0.4 | 2025-05-30 | Medication.code can now be a SNOMED CT code.<br/> New profile Substance to be used for Substance resources.<br/>New extension (Must Support) Episode.nprEpisodeIdentifier. <br/> New C# example code for authorization with HelseID. |
| 1.0.3 | 2025-04-11 | Removed MedicationRequest.dosageInstruction.patientInstruction and Medication.text from the profile. <br/> New extension: Medication.classification. <br/> Added example code in C# and PowerShell |
| 1.0.2 | 2025-04-01 | New extensions added to the MedicationRequest profile: ProsentvisDoseendring, DelAvBehandlingsregime, KliniskStudie |
| 1.0.1 | 2025-02-04 | Changed LegemiddelregisterBundle. Bundle type changed from Batch to Transaction |
| 1.0.0 | 2025-01-15 | First official version. Ready for testing. |
