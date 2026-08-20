Extension: IngrediensStyrke
Id: lmdi-ingredient-strength
Title: "Mengde ingrediens"
Description: """
Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som CodeableConcept.

Ved Quantity: Enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet.

Ved CodeableConcept: Kodet verdi som angir mengden ingrediens, f.eks. qs eller trace. F.eks. fra kodeverk "Angi at bestanddel i legemiddelblanding ikke har eksakt mengde" (OID 7502) eller "Medication-ingredientstrength" http://hl7.org/fhir/CodeSystem/medication-ingredientstrength
"""
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
* ^description.extension[=].extension[=].valueString = """
Amount of the ingredient in the requested/administered medication, expressed as a Quantity or as a CodeableConcept.

For Quantity: Either the amount of active ingredient in the requested/administered medication (e.g. 100 mg), or the volume of the ingredient used to produce the requested/administered medication (e.g. 10 mL). When volume is used, ingredient.item shall specify the “starting medication” used to produce the requested/administered medication in such a way that the strength of the “starting medication” can be derived. This is necessary to calculate the amount of active ingredient and the strength of the ingredient in the requested/administered medication.

For CodeableConcept: A coded value specifying the amount of the ingredient, e.g. qs or trace. For example from the Norwegian code system for components of a medication mixture without an exact amount (OID 7502), or "Medication-ingredientstrength" http://hl7.org/fhir/CodeSystem/medication-ingredientstrength
"""
* value[x] only CodeableConcept or Quantity
// Kodeverk anbefales i comment framfor binding: value[x] har to tillatte typer, så det finnes
// ikke noe eget valueCodeableConcept-element å binde. En binding på value[x] ville dessuten ha
// gjeldt Quantity-grenen, der den styrer enhetskoden.
* value[x] ^comment = "Ved kodet mengde anbefales det norske kodeverket med OID 2.16.578.1.12.4.1.1.7502, eller kodeverket medication-ingredientstrength fra FHIR R5 (kodene qs og trace)."
* value[x] ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* value[x] ^comment.extension[=].extension[+].url = "lang"
* value[x] ^comment.extension[=].extension[=].valueCode = #en
* value[x] ^comment.extension[=].extension[+].url = "content"
* value[x] ^comment.extension[=].extension[=].valueString = "For a coded amount, the recommended code systems are the Norwegian code system with OID 2.16.578.1.12.4.1.1.7502, or the FHIR R5 code system medication-ingredientstrength (codes qs and trace)."
