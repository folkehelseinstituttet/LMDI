Extension: RekvirertVed
Id: lmdi-rekvirert-ved
Title: "Rekvirert ved"
Description: "Stedet (organisasjonen) rekvireringen ble utført. Rekvireringen refererer også til en episode, som igjen kan referere til en organisasjon. Rekvirert ved benyttes hvis episoden reflekterer hele innleggelsen, dvs. i tilfeller der episoden ikke gjenspeiler pasientens forflytninger (f.eks. mellom ulike avdelinger) under innleggelsen."
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Requested at (RekvirertVed)"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "The place (organization) where the request was made. The request also references an episode, which in turn may reference an organization. Requested at (RekvirertVed) is used if the episode reflects the entire admission, i.e. in cases where the episode does not reflect the patient's transfers (e.g. between different departments) during the admission."
* value[x] only Reference(Organisasjon)
