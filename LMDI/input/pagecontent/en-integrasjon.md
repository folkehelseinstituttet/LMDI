

### Setting up integration with the Norwegian Medication Registry

#### Example code

FHI has developed example code showing how an integration with the Norwegian Medication Registry can be built. The example code is available in both C# and PowerShell and demonstrates the most important functions for secure data transfer to the registry.

You can find the example code here:
- [C# example code](en-eksempelkode_cs.html)
- [PowerShell example code](en-eksempelkode_ps1.html)


#### IP address whitelisting

To access the API for data transfer, the sending system's IP address must be registered in the LMR's list of whitelisted addresses. Both individual addresses and address ranges can be whitelisted.
Whitelisting is required only in the production environment.


#### Certificates

Data transferred to the API must be encrypted and signed (see [SignedEncryptedBundle](en-SignertKryptertBundle.html)).
- For signing, the private key in the sender's enterprise certificate is used. The public part of this certificate must be sent to the Medication Registry.
- For encrypting data, the public key in the Medication Registry's enterprise certificate is used. This can be downloaded [here](en-nedlastinger.html)


#### Maskinporten

The API is protected by Maskinporten and requires machine-to-machine authentication.

To gain access:

1. Register an integration in Digdir's collaboration portal (`https://sjolvbetjening.test.samarbeid.digdir.no/`)
    - Create a client
    - Request access to the scope `fhi:lmr/fhirmottak.api`
2. Implement the OAuth 2.0 Client Credentials flow with JWT bearer token. It is recommended to use the Altinn library: `https://github.com/Altinn/altinn-apiclient-maskinporten`
    - Generate a signing key directly in the self-service portal (PEM format) or create your own with an enterprise certificate.
    - Generate a signed JWT-assertion and send it to Maskinporten's token endpoint.
    - It is important to include the optional claim `Resource` in the JWT-assertion. This value must be `fhi:lmr/fhirmottak`.
    - The `Scope` claim must also be added. This value corresponds to the scope name in the self-service portal: `fhi:lmr/fhirmottak.api`
3. Include the received access token in the Authorization header as a Bearer token when calling the API


### Transferring data to the Norwegian Medication Registry

Institutions that transfer data to the Norwegian Medication Registry must follow the defined protocol. The protocol describes requirements for transfer frequency, data structure, and security. You can find more information here: [Protocol for data transfer](en-protokoll.html).

To build a collection of data to be transferred, a [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.html) must be created. This is a specialized FHIR Bundle profile developed for submitting data to the Medication Registry. It is restricted to transaction-type bundles and only allows POST operations, ensuring consistent data handling and traceability. The bundle can only contain specific resource types relevant to the Medication Registry: Patient, Practitioner, Medication, MedicationAdministration, Condition, Encounter, MedicationRequest, Organization, Substance.

When transferring data, a `SignedEncryptedBundle` must be created, which ensures both encryption and signing of the content. This process involves compressing, encrypting, and signing a FHIR-based `LegemiddelregisterBundle` before sending it to the API. Read more about how to create a `SignedEncryptedBundle` in [this guide](en-SignertKryptertBundle.html).

URLs for the Medication Registry API:
  - TEST environment: [https://test-fhirmottak.lmr.fhi.no/fhirmottak/v1](https://test-fhirmottak.lmr.fhi.no/fhirmottak/v1)
  - PROD environment: [https://fhirmottak.lmr.fhi.no/fhirmottak/v1](https://fhirmottak.lmr.fhi.no/fhirmottak/v1)


#### Test endpoints

For testing the integration, two dedicated validation endpoints are available. These store no data and are only available in the test environment.

**Validation of FHIR bundle:**
- `/fhirmottak/v1/validateLegemiddelregisterBundle` – Validates the contents of a FHIR bundle against the LMDI specification.
  The endpoint expects to receive an unsigned and unencrypted FHIR bundle in JSON format. Does not require authentication, and the sender does not need to be registered.
  Returns a validation result as `OperationOutcome` with status 200 (valid) or 400 (invalid).

**Validation of signed and encrypted bundle:**
- `/fhirmottak/v1/validate` – Validates that signing and encryption have been performed correctly, and that the content of the encrypted FHIR bundle complies with the LMDI specification.
  The endpoint expects to receive a signed and encrypted bundle. The sender must be registered and active. Data is validated but not stored.
  Requires Maskinporten authentication with scope `fhi:lmr/fhirmottak.api`.
  Returns status 200 (valid) or 400 (invalid).

#### Handling responses from test endpoints

The test endpoints return the following HTTP status codes:

**200 OK**
- The message was validated without errors
- For `/fhirmottak/v1/validate`: The message has been validated but not stored
- For `/fhirmottak/v1/validateLegemiddelregisterBundle`: Returns `OperationOutcome` confirming that the FHIR bundle is valid

**400 Bad Request**
- Validation errors in the submitted message
- Possible causes (both endpoints):
  - FHIR bundle validation failed (not in accordance with the LMDI specification)
  - Invalid JSON format
- Possible causes only for `/fhirmottak/v1/validate`:
  - Unknown or inactive sender
  - Organization number in message does not match registered sender
  - Signature validation failed
  - Decryption failed

**401 Unauthorized**
- Authentication failed (applies to `/fhirmottak/v1/validate`)
- Possible causes:
  - Missing Authorization header or token
  - Expired access token
  - Invalid token signature
  - Invalid issuer or audience
- The response includes a `WWW-Authenticate` header with an error description

**403 Forbidden**
- Authorization failed (applies to `/fhirmottak/v1/validate`)
- Token is valid, but lacks the required scope (`fhi:lmr/fhirmottak.api`)
- The response includes a `WWW-Authenticate` header with an error description

**500 Internal Server Error**
- An unexpected error occurred while processing the message
- Server error that should be investigated with FHI
