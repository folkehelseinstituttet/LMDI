Extension: NprEpisodeIdentifier
Id: npr-episode-identifier
Title: "NPR Episode Identifier"
Description: "Entydig identifikator for episode, brukt ved rapportering til NPR. Kan inneholde både string-basert og UUID-basert identifikator."
* ^context.type = #element
* ^context.expression = "Encounter"
* ^status = #active

* extension contains
    stringIdentifier 0..1 MS and
    uuidIdentifier 0..1 MS

* extension[stringIdentifier] ^short = "String-basert NPR episode identifikator"
* extension[stringIdentifier] ^definition = "String-basert identifikator for episoden som brukes ved rapportering til NPR."
* extension[stringIdentifier].value[x] only string
* extension[stringIdentifier].valueString 1..1

* extension[uuidIdentifier] ^short = "UUID-basert NPR episode identifikator"
* extension[uuidIdentifier] ^definition = "UUID-basert identifikator for episoden som brukes ved rapportering til NPR."
* extension[uuidIdentifier].value[x] only uuid
* extension[uuidIdentifier].valueUuid 1..1

* obeys npr-episode-at-least-one

Invariant: npr-episode-at-least-one
Description: "Minst én NPR episode identifikator (string eller UUID) må oppgis"
Expression: "extension('stringIdentifier').exists() or extension('uuidIdentifier').exists()"
Severity: #error
