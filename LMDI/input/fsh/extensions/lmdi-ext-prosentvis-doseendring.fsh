Extension: ProsentvisDoseendring
Id: lmdi-prosentvis-doseendring
Title: "Prosentvis doseendring"
Description: "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%."
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* value[x] only Quantity
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #%
* valueQuantity.unit = "%"
