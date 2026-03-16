// LokaltLegemiddel: benyttes ved angivelse av legemiddel fra lokal legemiddelkatalog
Instance: lmdi-lokaltLegemiddel
InstanceOf: NamingSystem
Usage: #definition
* name = "lmdiLokaltLegemiddel"
* status = #draft
* kind = #identifier
* date = "2024-06-10"
// Publisher blir overkjørt og blir korrigert til FHI. Blir rettet når instansene flyttes til no-basis-IG. 
* publisher = "Folkehelseinstituttet"
* responsible = "Folkehelseinstituttet"
* description = "Id for angivelse av legemiddel fra lokal legemiddelkatalog"
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
* uniqueId[=].value = "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"
* uniqueId[=].preferred = true
