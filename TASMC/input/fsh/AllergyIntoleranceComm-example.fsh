Instance: tasmc-comm-allergy-01
InstanceOf: TASMCCommAllergyIntolerance
Usage: #example
Title: "TASMC COMM AllergyIntolerance - Main Comment"
Description: "TASMC COMM allergy intolerance demonstrating comm-allergy-intolerance profile constraints"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">רגישות - הערה ראשית</div>"

// meta — ILHDPAllergyIntolerance: meta 1..1, meta only ILHDPMeta, fixed security
* meta.profile[tasmc-comm] = "http://fhir.tasmc.health.gov.il/StructureDefinition/comm-allergy-intolerance"
* meta.security[HDP].system = "http://fhir.health.gov.il/cs/il-hdp-information-buckets"
* meta.security[HDP].code = #allergiesAndIntolerances
* meta.security[HDP].display = "רגישויות"

// identifier — COMM: system fixed, value 1..1 | HDP invariant: one-strong-identifier
* identifier.system = "http://fhir.tasmc.health.gov.il/Identifier/comm-allergy-intolerance"
* identifier.value = "COMM-AI-001"
* identifier.type = http://fhir.health.gov.il/cs/il-core-identifier-type#strong-id "Strong Identifier"

// clinicalStatus + verificationStatus — HDP invariant: statuses-exist
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#confirmed

// code — COMM: cml slice 1..1 with fixed system/code/display
//        ILCore invariant: element-sct requires at least one SNOMED coding
* code.coding[cml].system = "http://fhir.tasmc.health.gov.il/cs/med-cml-code"
* code.coding[cml].code = #main-comment
* code.coding[cml].display = "Main comment"
* code.coding[+].system = $sct
* code.coding[=].code = #419199007
* code.coding[=].display = "Allergy to substance (disorder)"

// patient — required by FHIR base AllergyIntolerance
* patient.reference = "Patient/tasmc-patient-example"

// recorder — required per ILHDPAllergyIntolerance (CSV)
* recorder.reference = "Practitioner/TasmcPractitionerExample"
