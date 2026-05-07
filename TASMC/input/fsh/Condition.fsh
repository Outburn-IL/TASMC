Profile: TasmcCondition
Parent: ILHDPCondition
Id: tasmc-condition
Title: "TASMC Condition Profile"
Description: "Sourasky (TASMC) local profile for conditions and diagnoses, derived from ILHDPCondition."
* insert ConformanceMetadata

// --- meta.profile local slot ---
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.rules = #open
* meta.profile contains tasmc-condition 0..1
* meta.profile[tasmc-condition] = "http://fhir.tasmc.health.gov.il/StructureDefinition/tasmc-condition"

// --- identifier slicing ---
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier contains
    diagnosis 1..1 and
    row 1..1

* identifier[diagnosis].system 1..1
* identifier[diagnosis].system = "http://fhir.tasmc.org.il/identifier/diagnosis" (exactly)

* identifier[row].system 1..1
* identifier[row].system = "http://fhir.tasmc.org.il/identifier/diagnosis-row-id" (exactly)

// --- category slicing: death marker ---
* category contains death 0..1
* category[death].coding 1..*
* category[death].coding.system 1..1
* category[death].coding.system = $sct
* category[death].coding.code 1..1
* category[death].coding.code = #16100001
* category[death].coding.display 1..1
* category[death].coding.display = "Death diagnosis (contextual qualifier) (qualifier value)"

// --- code.coding slicing ---
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false
* code.coding contains
    sct 1..1 and
    icd9 0..1

* code.coding[sct].system 1..1
* code.coding[sct].system = $sct (exactly)
* code.coding[sct].code 1..1

* code.coding[icd9].system 1..1
* code.coding[icd9].system = "http://fhir.health.gov.il/cs/icd9il" (exactly)
