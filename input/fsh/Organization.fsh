Profile: TasmcOrganization
Parent: ILCoreOrganization
Id: tasmc-organization
Title: "Sourasky Organization Profile"
Description: "Sourasky Organization Profile"
// * insert ConformanceMetadata

* id 1..1

* identifier contains tasmc 1..1 and origin 0..* 
* identifier[tasmc].system 1..1
* identifier[tasmc].system = "http://fhir.tasmc.org.il/identifier/unit_id"
* identifier[tasmc].value 1..1
* identifier[tasmc].type.coding.system = "http://fhir.health.gov.il/cs/il-core-identifier-type"
* identifier[tasmc].type.coding.code = #strong-id
* identifier[tasmc].type.coding.display = "Strong Identifier"
* identifier[origin].system 1..1
* identifier[origin].value 1..1
* identifier[legal-entity].system 1..1
* identifier[legal-entity].value 1..1
* identifier[legal-entity].value = "500106919"

* type contains gate 0..1 and level 0..1 
* type[gate].coding.system 1..1
* type[gate].coding.system = "http://fhir.tasmc.org.il/cs/type-gate-id"
* type[gate].coding.code 1..1
* type[gate].coding.display 1..1
* type[level].coding.system 1..1
* type[level].coding.system = "http://fhir.tasmc.org.il/cs/type-level"
* type[level].coding.code 1..1
* type[level].coding.display 1..1

* partOf.reference 1..1

