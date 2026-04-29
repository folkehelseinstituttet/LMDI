# Protocol for data transfer to the Norwegian Medication Registry

This protocol describes how institutions (senders) shall integrate with the Medication Registry's FHIR reception API to transfer data on medication administrations.

## 1. Purpose
The purpose of this protocol is to ensure daily transfer of medication administration data from healthcare institutions to the Medication Registry in a secure and structured manner.

## 2. Transfer requirements

### 2.1 Frequency and content
- Data shall be transferred **daily**.
- Only **new** or **changed** data since the last successful transfer shall be sent.
- For the first transfer, data from an **agreed start date** shall be included.

### 2.2 Technical requirements
- Data is transferred via the **Medication Registry's FHIR reception API**.
- Resources must comply with the Medication Registry's **defined FHIR profiles**.
- Each transfer shall consist of a [signed and encrypted FHIR bundle](en-SignertKryptertBundle.html) to ensure integrity and confidentiality.
- API access requires authentication via **Maskinporten**.

## 3. Error handling

### 3.1 Communication errors
- If the API is unavailable, or an error occurs in communication, the transfer is considered failed.
- The data must then be transferred again.
- The sender may make up to **3 new attempts** with approximately **1 hour intervals**.

### 3.2 Validation errors
- For errors that occur during validation of resources, the API provides feedback in the form of specific **error codes**.
- Errors must be corrected manually at the sender before the resources are sent again in a later transfer.

## 4. Data validation
- All resources are validated against the Medication Registry's **FHIR profiles**.
- The API response provides a **status message** for each transferred resource, including details of any validation errors.

## 5. Security
- All communication with the API is secured using **Maskinporten**.
- Transferred data must be **signed** and **encrypted** to protect against unauthorized access and ensure data integrity.
- The sender must have valid **Maskinporten authentication** to communicate with the API.
