Instance: TasmcPractitionerExample
InstanceOf: TasmcPractitioner
Usage: #example
Title: "TASMC Practitioner Example"
Description: "Example of a TASMC practitioner with all telecom types"

* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">ד\"ר דוד כהן - רופא בתל אביב סוראסקי</div>"

* identifier[tasmc].system = "http://fhir.tasmc.org.il/identifier/tasmc-id"
* identifier[tasmc].value = "PRAC-54321"

* identifier[user-name].system = "http://fhir.tasmc.org.il/identifier/AD-user"
* identifier[user-name].value = "dr.cohen"

* identifier[il-id].system = "http://fhir.health.gov.il/identifier/il-national-id"
* identifier[il-id].value = "000000018"

* identifier[prac-lic].system = "http://practitioners.health.gov.il/Practitioners"
* identifier[prac-lic].value = "1-234567"

* active = true

* name.family = "כהן"
* name.given = "דוד"
* name.text = "ד\"ר דוד כהן"
* name.prefix = "ד\"ר"

* telecom[work].system = #phone
* telecom[work].use = #work
* telecom[work].value = "03-6974400"

* telecom[mobile].system = #phone
* telecom[mobile].use = #mobile
* telecom[mobile].value = "050-1234567"

* telecom[work-email].system = #email
* telecom[work-email].use = #work
* telecom[work-email].value = "david.cohen@tasmc.health.gov.il"

* telecom[home-email].system = #email
* telecom[home-email].use = #home
* telecom[home-email].value = "dcohen@example.com"

* gender = #male

* qualification[moh-practitioner-license].code = http://fhir.health.gov.il/cs/practitioner-certificate-type-moh#2
* qualification[moh-practitioner-license].identifier.system = "http://practitioners.health.gov.il/Practitioners"
* qualification[moh-practitioner-license].identifier.value = "1-234567"
* qualification[moh-practitioner-license].extension[practice].valueCodeableConcept = http://fhir.health.gov.il/cs/practitioner-profession-moh#1 "רפואה"
