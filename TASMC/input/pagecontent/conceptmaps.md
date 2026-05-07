<div dir="rtl" markdown="1">

### Concept Maps

מפות המושגים (ConceptMaps) מגדירות מיפוי בין קודים מקומיים של סוראסקי לסטנדרטים בינלאומיים. המיפוי מבוצע ברמת ה-IG ולא ברמת מערכת המקור (Autolab), מאחר שהקודים המקומיים הם ה-source of truth ושינויים ב-Autolab אינם בתחולת פרויקט זה.

---

#### tasmcSpecimenTypeToSct — סוגי דגימות → SNOMED CT

ממפה את קודי סוגי הדגימות המקומיים של סוראסקי לקודי SNOMED CT המתאימים. המיפוי חלקי — קודים שאין להם מקבילה ברורה ב-SNOMED CT אינם ממופים.

**מקור:** `tasmc-specimen-type`  
**יעד:** SNOMED CT  
**שימוש:** מאפשר לצרכנים לאתר משאבי Specimen לפי קודי SNOMED CT, גם כאשר הקוד המקומי אינו מוכר להם.

---

#### tasmcbodysitestosct — אתרי גוף → SNOMED CT

ממפה את קודי אתרי הגוף הפתולוגיים המקומיים לקודי SNOMED CT אנטומיים. מאחר שחלק מהקודים המקומיים משלבים אתר גוף עם סוג פרוצדורה, המיפוי מתייחס לרכיב האנטומי בלבד.

**מקור:** `tasmc-pathology-body-sites`  
**יעד:** SNOMED CT  
**שימוש:** מאפשר חיפוש סטנדרטי לפי אנטומיה ב-`Specimen.collection.bodySite`.

---

#### tasmcUnitsToUCUM — יחידות מידה → UCUM

ממפה את מחרוזות יחידות המידה כפי שמגיעות מ-Autolab לקודי UCUM (Unified Code for Units of Measure) הנדרשים ב-FHIR. הצורך נובע מחוסר אחידות בכתיב יחידות המידה במקור — לדוגמה, וריאנטים שונים של אותה יחידה (mg/dL, mg/dl, MG/DL) ממופים לקוד UCUM יחיד.

**מקור:** קודי יחידות מקומיים מ-Autolab  
**יעד:** UCUM  
**שימוש:** `Observation.value[x].unit` ו-`Observation.referenceRange`.

---

#### labosRequestCodeToLoincAndSnomed — קודי בדיקות → LOINC

ממפה קודי בדיקות מעבדה מקומיים של סוראסקי לקודי LOINC. LOINC הוא הסטנדרט המקובל לקידוד בדיקות מעבדה ב-FHIR; המיפוי מאפשר לצרכנים לזהות בדיקות לפי שפה בינלאומית מוכרת.

**מקור:** קודי בדיקות מקומיים מ-Autolab  
**יעד:** LOINC  
**שימוש:** `Observation.code`, `ServiceRequest.code`  
**הערה:** המיפוי אינו מלא — קודים שטרם שויכו ל-LOINC אינם כלולים בגרסה זו.

</div>
