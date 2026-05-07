Instance: TasmcConditionExample
InstanceOf: TasmcCondition
Usage: #example
Title: "TASMC Condition Example"
Description: "Example of a TASMC death-related condition diagnosis (acute myocardial infarction)"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">אוטם שריר הלב חריף - אבחנת פטירה</div>"

* meta.security[HDP].system = "http://fhir.health.gov.il/cs/il-hdp-information-buckets"
* meta.security[HDP].code = #diagnoses
* meta.profile[tasmc-condition] = "http://fhir.tasmc.health.gov.il/StructureDefinition/tasmc-condition"

* identifier[diagnosis].system = "http://fhir.tasmc.org.il/identifier/diagnosis"
* identifier[diagnosis].value = "DIAG-2024-98765"

* identifier[row].system = "http://fhir.tasmc.org.il/identifier/diagnosis-row-id"
* identifier[row].value = "ROW-001"

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#inactive
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed

* category[ilcore].coding = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis "Encounter Diagnosis"

* category[death].coding.system = $sct
* category[death].coding.code = #16100001
* category[death].coding.display = "Death diagnosis (contextual qualifier) (qualifier value)"

* code.coding[sct].system = $sct
* code.coding[sct].code = #22298006
* code.coding[sct].display = "Myocardial infarction (disorder)"

* code.coding[icd9].system = "http://fhir.health.gov.il/cs/icd9il"
* code.coding[icd9].code = #410.9
* code.coding[icd9].display = "Acute myocardial infarction, unspecified site"

* subject.reference = "Patient/tasmc-patient-example"

* recordedDate = "2024-11-15"

* recorder.reference = "Practitioner/TasmcPractitionerExample"
