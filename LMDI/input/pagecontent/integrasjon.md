

### Etablering av integrasjon mot Legemiddelregisteret

#### Eksempelkode


FHI har laget eksempelkode som viser hvordan en integrasjon mot Legemiddelregisteret kan utvikles. Eksempelkoden er tilgjengelig i både C# og PowerShell, og demonstrerer de viktigste funksjonene for sikker dataoverføring til registeret.

Du finner eksempelkoden her:
- [C# eksempelkode](eksempelkode_cs.html)
- [PowerShell eksempelkode](eksempelkode_ps1.html)


#### Hvitelisting av IP-adresse

For å få tilgang til API-et for overføring av data kreves det at avsendersystemets IP-adresse registreres i LMRs oversikt over hvitelistede adresser. Både enkeltadresser og adresseområder kan hvitelistes. 
Det er kun hvitelisting i produksjonsmiljøet.


#### Sertifikater

Data som overføres til API-et skal være kryptert og signert (se [SignertKryptertBundle](SignertKryptertBundle.html)). 
- Ved signering benyttes privat nøkkel i avsenders virksomhetssertifikat. Den offentlige delen av dette sertifikatet må sendes til Legemiddelregisteret. 
- Ved kryptering av data benyttes offentlig nøkkel i Legemiddelregisterets virksomhetssertifikat. Dette kan lastes ned [her](nedlastinger.html)


#### Maskinporten

APIet er beskyttet av Maskinporten og krever at klienter autentiserer seg med maskin-til-maskin autentisering.

For å få tilgang:

1. Registrer integrasjon i Digdir sin samarbeidsportal (`https://sjolvbetjening.test.samarbeid.digdir.no/`)
    - Opprett en klient 
    - Be om tilgang til scopet `fhi:lmr/fhirmottak.api`
2. Implementer OAuth 2.0 Client Credentials flow med JWT bearer token. Det anbefales og bruke bibilioteket til Altinn: `https://github.com/Altinn/altinn-apiclient-maskinporten`
    - Generer en signeringsnøkkel direkte i selvbetjeningsportalen (PEM-format) eller lag en selv med eget virksomhetssertifikat.
    - Generer signert JWT-assertion og send til maskinporten sitt token-endepunkt.
    - Det er viktig å inkludere det valgfrie claimet `Resource` i JWT-assertion. Denne verdien skal være `fhi:lmr/fhirmottak`.
    - `Scope` claimet må også legges til. Denne verdien korresponderer med navnet på scopet i selvbetjeningsportalen: `fhi:lmr/fhirmottak.api`
3. Inkluder motatt access token i Authorization-headeren som Bearer token ved kall til API-et


### Overføring av data til Legemiddelregisteret

Institusjoner som skal overføre data til Legemiddelregisteret, må følge den definerte protokollen. Protokollen beskriver krav til overføringsfrekvens, datastruktur og sikkerhet. Du finner mer informasjon her: [Protokoll for overføring av data](protokoll.html).

For å bygge en samling med data som skal overføres må det lages en [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.html). Dette er en spesialisert FHIR Bundle-profil utviklet for innsending av data til Legemiddelregisteret. Den er begrenset til transaction-type bundles og tillater kun POST-operasjoner, noe som sikrer konsistent datahåndtering og sporbarhet. Bundlen kan kun inneholde spesifikke ressurstyper som er relevante for Legemiddelregisteret: Pasient, Helsepersonell, Legemiddel, Legemiddeladministrering, Diagnose, Episode, Legemiddelrekvirering, Organisasjon, Virkestoff. 

Ved overføring av data skal det lages en `SignertKryptertBundle`, som sikrer både kryptering og signering av innholdet. Denne prosessen innebærer å komprimere, kryptere og signere en FHIR-basert `LegemiddelregisterBundle` før den sendes til API-et. Les mer om hvordan du oppretter en `SignertKryptertBundle` i [denne veiledningen](SignertKryptertBundle.html).

URL til Legemiddelregisterets API:
  - TEST-miljø: [https://test-fhirmottak.lmr.fhi.no/fhirmottak/v1](https://test-fhirmottak.lmr.fhi.no/fhirmottak/v1)
  - PROD-miljø: [https://fhirmottak.lmr.fhi.no/fhirmottak/v1](https://fhirmottak.lmr.fhi.no/fhirmottak/v1)


#### Testendepunkter

For testing av integrasjonen er det tilgjengelig to dedikerte valideringsendepunkter. Disse lagrer ingen data og er kun tilgjengelig i testmiljøet.

**Validering av FHIR-bundle:**
- `/fhirmottak/v1/validateLegemiddelregisterBundle` – Validerer innholdet i en FHIR-bundle mot LMDI-spesifikasjonen.  
  Endepunktet forventer å motta en usignert og ukryptert FHIR-bundle i JSON-format. Krever ikke autentisering, og avsender trenger ikke være registrert.  
  Returnerer valideringsresultat som `OperationOutcome` med status 200 (gyldig) eller 400 (ugyldig).

**Validering av signert og kryptert bundle:**
- `/fhirmottak/v1/validate` – Validerer at signering og kryptering er utført korrekt, samt at innholdet i den krypterte FHIR-bundelen er i henhold til LMDI-spesifikasjonen.  
  Endepunktet forventer å motta en signert og kryptert bundle. Avsender må være registrert og aktiv. Data valideres, men lagres ikke.  
  Krever Maskinporten-autentisering med scope `fhi:lmr/fhirmottak.api`.  
  Returnerer status 200 (gyldig) eller 400 (ugyldig).

#### Håndter respons fra testendepunktene

Testendepunktene returnerer følgende HTTP-statuskoder:

**200 OK**
- Meldingen ble validert uten feil
- Ved `/fhirmottak/v1/validate`: Meldingen er validert, men ikke lagret
- Ved `/fhirmottak/v1/validateLegemiddelregisterBundle`: Returnerer `OperationOutcome` som bekrefter at FHIR-bundelen er gyldig

**400 Bad Request**
- Valideringsfeil i den innsendte meldingen
- Mulige årsaker (begge endepunkter):
  - FHIR-bundle-validering feilet (ikke i henhold til LMDI-spesifikasjonen)
  - Ugyldig JSON-format
- Mulige årsaker kun for `/fhirmottak/v1/validate`:
  - Ukjent eller inaktiv avsender
  - Organisasjonsnummer i melding stemmer ikke med registrert avsender
  - Signaturvalidering feilet
  - Dekryptering feilet

**401 Unauthorized**
- Autentisering feilet (gjelder `/fhirmottak/v1/validate`)
- Mulige årsaker:
  - Manglende Authorization-header eller token
  - Utløpt access token
  - Ugyldig tokensignatur
  - Ugyldig utsteder (issuer) eller mottaker (audience)
- Responsen inkluderer en `WWW-Authenticate`-header med feilbeskrivelse

**403 Forbidden**
- Autorisering feilet (gjelder `/fhirmottak/v1/validate`)
- Token er gyldig, men mangler påkrevd scope (`fhi:lmr/fhirmottak.api`)
- Responsen inkluderer en `WWW-Authenticate`-header med feilbeskrivelse

**500 Internal Server Error**
- En uventet feil oppstod ved behandling av meldingen
- Serverfeil som bør undersøkes med FHI