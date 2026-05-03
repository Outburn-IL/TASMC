Profile: TASMCMedAllergyIntolerance
Parent: ILHDPAllergyIntolerance
Id: tasmc-med-allergy-intolerance
Title: "TASMC Medication AllergyIntolerance Profile"
Description: "Sourasky (TASMC) local profile for medication-related allergies and intolerances, derived from ILHDPAllergyIntolerance."
* insert ConformanceMetadata
// --- meta.profile local slot ---
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.rules = #open
* meta.profile contains tasmc-med 0..1
* meta.profile[tasmc-med] = "http://fhir.tasmc.health.gov.il/StructureDefinition/tasmc-med-allergy-intolerance"

// --- identifier ---
* identifier 1..*
* identifier.system 1..1
* identifier.value 1..1

// --- category fixed to medication ---
* category = #medication

// --- code.coding slicing ---
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false
* code.coding contains
    snomed 1..* and
    cml 1..*

* code.coding[snomed].system 1..1
* code.coding[snomed].system = $sct
* code.coding[snomed].code 1..1

* code.coding[cml].system 1..1
* code.coding[cml].system = "http://fhir.tasmc.health.gov.il/cs/med-cml-code"
* code.coding[cml].code 1..1

// --- extension[AllergyIntoleranceEnd].extension[reasonEnded].valueCodeableConcept.text ---
* extension[AllergyIntoleranceEnd].extension[reasonEnded].value[x].text 1..1

// --- reaction.manifestation.coding slicing ---
* reaction.manifestation.coding ^slicing.discriminator.type = #pattern
* reaction.manifestation.coding ^slicing.discriminator.path = "$this"
* reaction.manifestation.coding ^slicing.rules = #open
* reaction.manifestation.coding ^slicing.ordered = false
* reaction.manifestation.coding contains
    cml 1..* and
    ilcore 1..*

* reaction.manifestation.coding[cml].system 1..1
* reaction.manifestation.coding[cml].system = "http://fhir.tasmc.health.gov.il/cs/reaction-cml-code"
* reaction.manifestation.coding[cml].code 1..1

* reaction.manifestation.coding[ilcore].system 1..1
* reaction.manifestation.coding[ilcore].code 1..1
* reaction.manifestation from $vs-il-core-manifestation (required)
