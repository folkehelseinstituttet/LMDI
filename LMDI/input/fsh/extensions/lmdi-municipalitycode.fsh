Extension: LmdiMunicipalitycode
Id: lmdi-municipalitycode
Title: "lmdi-municipalitycode"
Description: "Kodet verdi for kommune"
* ^version = "2.0.16"
* ^date = "2025-03-10"
* ^context.type = #element
* ^context.expression = "Address.district"
* value[x] only Coding
* value[x] from KommunenummerValueSet (required)
* value[x].system = "urn:oid:2.16.578.1.12.4.1.1.3402" (exactly)
* value[x].code ^short = "Kommunenummer"
* value[x].code ^definition = "Norwegian kommunenummer from Volven 3402"