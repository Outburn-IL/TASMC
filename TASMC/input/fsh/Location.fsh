Profile: TasmcLocation
Parent: ILHDPLocation
Id: tasmc-location
Title: "Sourasky Location Profile"
Description: "Sourasky Location Profile"
* insert ConformanceMetadata
* id 1..1
* identifier
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^slicing.ordered = false
  
* identifier contains tasmc 1..1 and origin 0..* 
* identifier[tasmc].system 1..1
* identifier[tasmc].system = "http://fhir.tasmc.org.il/identifier/location_id" (exactly)
* identifier[tasmc].value 1..1
* identifier[tasmc].type.coding.system = "http://fhir.health.gov.il/cs/il-core-identifier-type" (exactly)
* identifier[tasmc].type.coding.code = #strong-id
* identifier[tasmc].type.coding.display = "Strong Identifier"

* type.coding.system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode" (exactly)
* type.coding.code = #HU
* type.coding.display = "Hospital unit" 

* managingOrganization.reference 1..1

