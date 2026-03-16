// Under utvikling i LMDI-prosjektet. 
// LegemiddelVirkestoff: benyttes ved virkestoffrekvirering
// Mål: Være en del av no-basis. 
Instance: no-basis-fest-legemiddelvirkestoff
InstanceOf: NamingSystem
Usage: #definition
* name = "festLegemiddelVirkestoff"
* status = #draft
* kind = #identifier
* date = "2024-06-10"
// Publisher blir overkjørt og blir korrigert til FHI. Blir rettet når instansene flyttes til no-basis-IG. 
* publisher = "Helsedirektoratet"
* responsible = "Direktoratet for medisinske produkter"
* description = "FEST-id for virkestoff. Benyttes ved virkestoffrekvirering"
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
* uniqueId[=].value = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* uniqueId[=].preferred = true
