Extension: LmdiUrbanDistrict
Id: lmdi-urban-district
Title: "lmdi-urban-district"
Description: "Information about Norwegian urban district (bydel)"
* ^version = "1.0.6"
* ^context.type = #element
* ^context.expression = "Address"
* value[x] only Coding
* value[x] from $VsLmdiUrbanDistrict (required)
* value[x].system = "urn:oid:2.16.578.1.12.4.1.1.3403" (exactly)
* value[x].code ^short = "Bydelskode"
* value[x].display ^short = "Bydelsnavn"

