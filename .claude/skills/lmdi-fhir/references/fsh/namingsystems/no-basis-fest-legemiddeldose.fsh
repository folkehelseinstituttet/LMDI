// Under utvikling i LMDI-prosjektet. 
// LegemiddelDose: Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett.
// Mål: Være en del av no-basis. 
Instance: no-basis-fest-legemiddeldose
InstanceOf: NamingSystem
Usage: #definition
* name = "festLegemiddelDose"
* status = #draft
* kind = #identifier
* date = "2024-06-10"
// Publisher blir overkjørt og blir korrigert til FHI. Blir rettet når instansene flyttes til no-basis-IG. 
* publisher = "Helsedirektoratet"
* responsible = "Direktoratet for medisinske produkter"
* description = "FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett."
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
* uniqueId[=].value = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* uniqueId[=].preferred = true
