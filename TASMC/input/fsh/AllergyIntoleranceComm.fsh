Profile: TASMCCommAllergyIntolerance
Parent: ILHDPAllergyIntolerance
Id: comm-allergy-intolerance
Title: "TASMC COMM AllergyIntolerance Profile"
Description: "Sourasky (TASMC) local profile for COMM system allergy intolerances, derived from ILHDPAllergyIntolerance."
* insert ConformanceMetadata

// --- meta.profile local slot ---
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.rules = #open
* meta.profile contains tasmc-comm 0..1
* meta.profile[tasmc-comm] = "http://fhir.tasmc.health.gov.il/StructureDefinition/comm-allergy-intolerance"

// --- identifier ---
* identifier 1..*
* identifier.system 1..1
* identifier.system = "http://fhir.tasmc.health.gov.il/Identifier/comm-allergy-intolerance" (exactly)
* identifier.value 1..1

// --- code.coding slicing ---
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false
* code.coding contains cml 1..1

* code.coding[cml].system 1..1
* code.coding[cml].system = "http://fhir.tasmc.health.gov.il/cs/med-cml-code" (exactly)
* code.coding[cml].code 1..1
* code.coding[cml].code = #main-comment (exactly)
* code.coding[cml].display = "Main comment"
