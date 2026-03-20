Extension: NprEpisodeIdentifier
Id: npr-episode-identifier
Title: "NPR Episode Identifier"
Description: "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren."
* ^context.type = #element
* ^context.expression = "Encounter"
* ^status = #active

* extension contains
    stringIdentifier 0..1 MS and
    uuidIdentifier 0..1 MS

* extension[stringIdentifier] ^short = "String-representasjon av NPR episodeidentifikatoren"
* extension[stringIdentifier] ^definition = "String-representasjon av den valgte NPR episodeidentifikatoren. Skal oppgis dersom string-representasjonen av identifikatoren er tilgjengelig."
* extension[stringIdentifier].value[x] only string
* extension[stringIdentifier].valueString 1..1

* extension[uuidIdentifier] ^short = "UUID-representasjon av NPR episodeidentifikatoren"
* extension[uuidIdentifier] ^definition = "UUID-representasjon av den valgte NPR episodeidentifikatoren. Skal oppgis dersom UUID-representasjonen av identifikatoren er tilgjengelig."
* extension[uuidIdentifier].value[x] only uuid
* extension[uuidIdentifier].valueUuid 1..1

* obeys npr-episode-at-least-one

Invariant: npr-episode-at-least-one
Description: "Minst én NPR episode identifikator (string eller UUID) må oppgis"
Expression: "extension('stringIdentifier').exists() or extension('uuidIdentifier').exists()"
Severity: #error
