# Protokoll - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Integrasjon**](integrasjon.md)
* **Protokoll**

# Protokoll for overføring av data til Legemiddelregisteret

Denne protokollen beskriver hvordan institusjoner (avsendere) skal integrere seg med Legemiddelregisterets FHIR-mottak API for å overføre data om legemiddeladministrasjoner.

## 1. Formål

Formålet med denne protokollen er å sikre daglig overføring av legemiddeladministrasjonsdata fra helseinstitusjoner til Legemiddelregisteret på en sikker og strukturert måte.

## 2. Overføringskrav

### 2.1 Frekvens og innhold

* Data skal overføres **daglig**.
* Kun **nye** eller **endrede** data siden siste vellykkede overføring skal sendes.
* Ved førstegangs overføring skal data fra en **avtalt startdato** inkluderes.

### 2.2 Tekniske krav

* Data overføres via **Legemiddelregisterets FHIR-mottak API**.
* Ressursene må følge Legemiddelregisterets **definerte FHIR-profiler**.
* Hver overføring skal bestå av en [signert og kryptert FHIR-bundle](SignertKryptertBundle.md) for å sikre integritet og konfidensialitet.
* API-tilgang krever autentisering via **HelseID**.

## 3. Feilhåndtering

### 3.1 Kommunikasjonsfeil

* Dersom API-et er utilgjengelig, eller det oppstår en feil i kommunikasjonen, regnes overføringen som mislykket.
* Dataene må da overføres på nytt.
* Avsender kan gjøre opptil **3 nye forsøk** med ca. **1 times mellomrom**.

### 3.2 Valideringsfeil

* Ved feil som oppstår under validering av ressursene, gir API-et tilbakemelding i form av spesifikke **feilkoder**.
* Feil må korrigeres manuelt hos avsender før ressursene sendes på nytt i en senere overføring.

## 4. Datavalidering

* Alle ressurser valideres mot Legemiddelregisterets **FHIR-profiler**.
* API-responsen gir en **statusmelding** for hver overført ressurs, inkludert detaljer om eventuelle valideringsfeil.

## 5. Sikkerhet

* All kommunikasjon med API-et sikres ved hjelp av **HelseID**.
* Overførte data må være **signerte** og **krypterte** for å beskytte mot uautorisert tilgang og sikre dataintegritet.
* Avsender må ha gyldig **HelseID-autentisering** for å kunne kommunisere med API-et.

