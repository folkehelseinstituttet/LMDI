Extension: IngrediensStyrke
Id: lmdi-ingredient-strength
Title: "Mengde ingrediens"
Description: "Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som kode. Angir enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet."
// Speiler Medication.ingredient.strength[x] i FHIR R5/R6, som tillater Ratio, CodeableConcept og
// Quantity. I R4 er strength en ren Ratio, så de to øvrige variantene må uttrykkes som extension.
// R4-invarianten rat-1 tillater en Ratio uten teller og nevner når den har en extension.
* ^context.type = #element
* ^context.expression = "Medication.ingredient.strength"
* ^status = #draft
* ^date = "2026-08-18"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Amount of ingredient"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Amount of the ingredient in the requested/administered medication, expressed as a Quantity or as a code. Specifies either the amount of active ingredient in the requested/administered medication (e.g. 100 mg), or the volume of the ingredient used to produce the requested/administered medication (e.g. 10 mL). When volume is used, ingredient.item shall specify the “starting medication” used to produce the requested/administered medication in such a way that the strength of the “starting medication” can be derived. This is necessary to calculate the amount of active ingredient and the strength of the ingredient in the requested/administered medication."
* value[x] only CodeableConcept or Quantity
// Bindingen settes på value[x], ikke på valueCodeableConcept: med to tillatte typer finnes det
// ikke noe eget valueCodeableConcept-element. Kodeverket har kun kodene qs og trace.
* value[x] ^binding.strength = #preferred
* value[x] ^binding.description = "Medication Ingredient Strength Codes"
* value[x] ^binding.valueSet = "http://hl7.org/fhir/ValueSet/medication-ingredientstrength"
