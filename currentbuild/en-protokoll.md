# Protocol - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.1

* [Home](en-index.md)
* [Information model](en-informasjonsmodell.md)
* [Integration](en-integrasjon.md)
* [FHIR profiles](en-profiler.md)
* [Downloads](en-nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Integration**](en-integrasjon.md)
* **Protocol**

# Protocol for data transfer to Legemiddelregisteret

This protocol describes how institutions (senders) shall integrate with Legemiddelregisteret’s FHIR receiver API to transfer data on medication administrations.

## 1. Purpose

The purpose of this protocol is to ensure daily transfer of medication administration data from healthcare institutions to Legemiddelregisteret in a secure and structured manner.

## 2. Transfer requirements

### 2.1 Frequency and content

* Data must be transferred **daily**.
* Only **new** or **changed** data since the last successful transfer shall be sent.
* On first-time transfer, data from an **agreed start date** must be included.

### 2.2 Technical requirements

* Data is transferred via the **Legemiddelregisteret’s FHIR receiver API**.
* Resources must conform to Legemiddelregisteret’s **defined FHIR profiles**.
* Each transfer must consist of a [signed and encrypted FHIR bundle](en-SignertKryptertBundle.md) to ensure integrity and confidentiality.
* API access requires authentication via **Maskinporten**.

## 3. Error handling

### 3.1 Communication errors

* If the API is unavailable or a communication error occurs, the transfer is considered to have failed.
* The data must then be retransferred.
* The sender may make up to **3 new attempts** at approximately **1-hour intervals**.

### 3.2 Validation errors

* For errors that occur during validation of the resources, the API provides feedback in the form of specific **error codes**.
* Errors must be corrected manually by the sender before the resources are resent in a later transfer.

## 4. Data validation

* All resources are validated against Legemiddelregisteret’s **FHIR profiles**.
* The API response provides a **status message** for each transferred resource, including details of any validation errors.

## 5. Security

* All communication with the API is secured using **Maskinporten**.
* Transferred data must be **signed** and **encrypted** to protect against unauthorised access and ensure data integrity.
* The sender must have valid **Maskinporten authentication** to communicate with the API.

