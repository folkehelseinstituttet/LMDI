Extension: NprEpisodeIdentifier
Id: npr-episode-identifier
Title: "NPR Episode Identifier"
Description: "Entydig identifikator for episode som skal sendes til LMDI. Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Forretningsregelen for LMDI er at kun én NPR-identifikator skal sendes per episode. Selv om helseinstitusjonens systemer kan ha flere NPR-identifiere for samme episode lokalt, skal kun én velges ved innsending - gjerne den første eller foretrukne identifikatoren lokalt."
* ^context.type = #element
* ^context.expression = "Encounter"
* ^status = #active

* extension contains
    stringIdentifier 0..1 MS and
    uuidIdentifier 0..1 MS

* extension[stringIdentifier] ^short = "String-representasjon av NPR episodeidentifikatoren"
* extension[stringIdentifier] ^definition = "String-representasjon av den valgte NPR episodeidentifikatoren som sendes til LMDI. Skal oppgis dersom stringrepresentasjonen av identifikatoren er tilgjengelig."
* extension[stringIdentifier].value[x] only string
* extension[stringIdentifier].valueString 1..1

* extension[uuidIdentifier] ^short = "UUID-representasjon av NPR episodeidentifikatoren"
* extension[uuidIdentifier] ^definition = "UUID-representasjon av den valgte NPR episodeidentifikatoren som sendes til LMDI. Skal oppgis dersom UUID-representasjonen av identifikatoren er tilgjengelig."
* extension[uuidIdentifier].value[x] only uuid
* extension[uuidIdentifier].valueUuid 1..1

* obeys npr-episode-at-least-one

Invariant: npr-episode-at-least-one
Description: "Minst én NPR episode identifikator (string eller UUID) må oppgis"
Expression: "extension('stringIdentifier').exists() or extension('uuidIdentifier').exists()"
Severity: #error
