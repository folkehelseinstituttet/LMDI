# Legemiddeldata fra institusjon til Legemiddelregisteret (LMDI)

Komplette og oppdaterte helsedata på legemidler er tilgjengelig for analyse og forskning med tanke på å forbedre kvalitet, styring, helseovervåking, beredskap og kunnskapsforvaltning i helsetjenesten

## Mål

Samle inn legemiddeldata på individnivå fra polikliniske og innlagte pasienter i institusjon til Legemiddelregisteret (LMR). Som et ledd i dette utvikles det en implementasjonsguide (IG) basert på en felles informasjonsmodell og HL7 FHIR (dette dokumentet). Dette skal benyttes for innsending av data fra institusjon til LMR ved hjelp av datadeling (sikret REST API).

<img src="LMDI/input/images/lmdi-1.png" width="75%" />

## Spesifikasjon

### Overordnet informasjonsmodell

<img src="LMDI/input/images/informasjonsmodell-enkel.svg" width="100%" />

## Utvikling

- All koding av profiler skjer med [FHIR Shorthand](https://www.hl7.org/fhir/uv/shorthand/) (FSH)
- Dokumentasjon genereres med [IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)

I første omgang utvikles implementasjonsguiden for [FHIR R4](https://www.hl7.org/fhir/R4/), da dette er anbefalingen fra Helsedirektoratet og HL7 Norge. Tilrettelegging for R4B eller R5 må vurderes på et senere tidspunkt. 

Er HL7 FHIR nytt for deg anbefaler vi å ta en titt på [HL7 Norge sin side med ressurser](https://hl7norway.github.io/best-practice/docs/resources.html), f.eks. introduksjon for henholdsvis [klinikere](https://www.hl7.org/fhir/overview-clinical.html), [arkitekter](https://www.hl7.org/fhir/overview-arch.html) og [utviklere](https://www.hl7.org/fhir/overview-dev.html).

## Samhandlingsarkitektur

Hovedmålet er datadeling ved hjelp av RESTful API i henhold til [HL7 FHIR sin spesifikasjon](https://hl7.org/fhir/R4/http.html), og etter [anbefaling fra Helsedirektoratet](https://www.ehelse.no/standardisering/standarder/anbefaling-om-bruk-av-hl7-fhir-for-datadeling). 

Inntil videre er profilene og implementasjonsguiden ([se siste build](https://hl7norway.github.io/LMDI/currentbuild/)) agnostiske til om det skal genereres dokumenter eller forskjellig mønster for REST API (f.eks. *reference* vs *logical id*). 

<img src="LMDI/input/images/flyt-enkel-1.svg" width="60%" />

## Plan

Versjon 1.0 våren 2025.

## Status og historikk

- 2024-06-27: Versjon 0.9 klar for test
- 2024-06-13: Versjon 0.8
- 2024-05-28: Versjon 0.5 klar for teknisk gjennomgang og kommentering fra torsdag 30.5.2025
- 2024-05-23: Versjon 0.2

## Kontakt

Har du spørsmål om implementasjonsguiden eller innsending av data til Legemiddelregisteret, ta kontakt med Legemiddelregisteret på [legemiddelregisteret@fhi.no](mailto:legemiddelregisteret@fhi.no).

<img src="LMDI/input/images/logo-norsk-hele-navnet.svg" height="120px" />
<br clear="all"/>
