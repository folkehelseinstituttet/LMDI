# Integrasjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* **Integrasjon**

### Etablering av integrasjon mot Legemiddelregisteret

#### Eksempelkode

FHI har laget eksempelkode som viser hvordan en integrasjon mot Legemiddelregisteret kan utvikles. Eksempelkoden er tilgjengelig i både C# og PowerShell, og demonstrerer de viktigste funksjonene for sikker dataoverføring til registeret.

Du finner eksempelkoden her:

* [C# eksempelkode](eksempelkode_cs.md)
* [PowerShell eksempelkode](eksempelkode_ps1.md)

#### Hvitelisting av IP-adresse

For å få tilgang til API-et for overføring av data kreves det at avsendersystemets IP-adresse registreres i LMRs oversikt over hvitelistede adresser. Både enkeltadresser og adresseområder kan hvitelistes. Det er kun hvitelisting i produksjonsmiljøet.

#### Sertifikater

Data som overføres til API-et skal være kryptert og signert (se [SignertKryptertBundle](SignertKryptertBundle.md)).

* Ved signering benyttes privat nøkkel i avsenders virksomhetssertifikat. Den offentlige delen av dette sertifikatet må sendes til Legemiddelregisteret.
* Ved kryptering av data benyttes offentlig nøkkel i Legemiddelregisterets virksomhetssertifikat. Dette kan lastes ned [her](nedlastinger.md)

#### HelseId

APIet er beskyttet av HelseID og krever at klienter autentiserer seg med Client Credentials Grant.

For å få tilgang:

1. Registrer nytt klientsystem og ny klient i HelseID selvbetjeningsportal
* Skal ha tilgang til API-et fhi:lmr.fhirmottak med scope fhi:lmr.fhirmottak/api

1. Implementer OAuth 2.0 client credentials flow
1. Inkluder access token som DPoP token i Authorization-headeren og legg til en DPoP-header med et signert bevis (proof JWT).

### Overføring av data til Legemiddelregisteret

Institusjoner som skal overføre data til Legemiddelregisteret, må følge den definerte protokollen. Protokollen beskriver krav til overføringsfrekvens, datastruktur og sikkerhet. Du finner mer informasjon her: [Protokoll for overføring av data](protokoll.md).

For å bygge en samling med data som skal overføres må det lages en [LegemiddelregisterBundle](StructureDefinition-lmdi-bundle.md). Dette er en spesialisert FHIR Bundle-profil utviklet for innsending av data til Legemiddelregisteret. Den er begrenset til transaction-type bundles og tillater kun POST-operasjoner, noe som sikrer konsistent datahåndtering og sporbarhet. Bundlen kan kun inneholde spesifikke ressurstyper som er relevante for Legemiddelregisteret: Pasient, Helsepersonell, Legemiddel, LegemiddelAdministrasjon, Diagnose, Institusjonsopphold, Legemiddelrekvirering, Organisasjon.

Ved overføring av data skal det lages en `SignertKryptertBundle`, som sikrer både kryptering og signering av innholdet. Denne prosessen innebærer å komprimere, kryptere og signere en FHIR-basert `LegemiddelregisterBundle` før den sendes til API-et. Les mer om hvordan du oppretter en `SignertKryptertBundle` i [denne veiledningen](SignertKryptertBundle.md).

URL til Legemiddelregisterets API:

* TEST-miljø: [https://test-fhirmottak.lmr.fhi.no/fhirmottak/v1](https://test-fhirmottak.lmr.fhi.no/fhirmottak/v1)
* PROD-miljø: [https://fhirmottak.lmr.fhi.no/fhirmottak/v1](https://fhirmottak.lmr.fhi.no/fhirmottak/v1)

Responskoder 200 OK 400 BadRequest

#### Testendepunkter

For testing av integrasjonen er det tilgjengelig to dedikerte valideringsendepunkter. Disse lagrer ingen data.

**Validering av kryptert og signert bundle:**

* `/fhirmottak/v1/validateLegemiddelregisterBundle` - Validerer at kryptering og signering er utført korrekt, samt at innholdet i FHIR-bundelen er i henhold til spesifikasjonen. Returnerer valideringsresultat.

**Validering av FHIR-bundle:**

* `/fhirmottak/v1/validate` - Validerer innholdet i en ukryptert FHIR-bundle. Tar FHIR JSON som input og returnerer valideringsresultat.

#### Håndter respons fra API-et

