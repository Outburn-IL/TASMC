<div dir="rtl" markdown="1">

### ארכיטקטורת FHIR Conversion

תהליך ההמרה ממיר מסרי HL7 V2 ממערכת Autolab למשאבי FHIR באמצעות FUME כמנוע המרה, על גבי תשתית InterSystems HealthShare HealthConnect.

</div>

![ארכיטקטורת FHIR Conversion](etl-architecture.svg)

<div dir="rtl" markdown="1">

---

### רכיבים עיקריים

#### Autolab — מערכת המקור

מערכת המעבדות שולחת מסרי HL7 V2 מסוג `ORU^R01` לדיווח תוצאות. המסרים מועברים ל-HealthConnect בזמן אמת.

#### HealthShare HealthConnect — תשתית האינטגרציה

InterSystems HealthShare HealthConnect מקבל את מסרי HL7 ומנתב אותם לתהליך ההמרה. FUME Plugin המוטמע ב-HealthConnect מזהה את סוג המסר ומפעיל את קריאת ה-FUME API המתאימה.

#### FUME — מנוע ההמרה

FUME (FHIR Utilization and Mapping Engine) ממיר כל מסר לפי מפת המרה ייעודית. בתהליך ההמרה:

- קריאת ConceptMaps משרת ה-FHIR לתרגום קודים מקומיים לסטנדרטים (LOINC, SNOMED CT, UCUM)
- פתרון הפניות — מזהי מטופלים, ארגונים, מיקומים
- החזרת FHIR Bundle מוכן לשמירה

לכל סוג מעבדה ולכל סוג מסר קיימת מפת המרה ייעודית, המנותבת לפי פרמטרים במסר.

#### FHIR Server — אחסון ואימות

InterSystems IRIS FHIR Server משמש גם כמאגר ConceptMaps ומפות ההמרה וגם כיעד הסופי. הבאנדל עובר ולידציה מול IL Core ופרופילי סוראסקי לפני שמירה. כל המשאבים נשלחים כ-`PUT` עם מזהים דטרמיניסטיים — שליחה חוזרת מעדכנת ואינה יוצרת כפילות.

---

### גישה חיצונית

גורמים חיצוניים ניגשים לשרת ה-FHIR דרך שכבת DMZ ו-Interceptor. ה-Interceptor אחראי על סינון תוכן בהתאם לזהות הפונה, הסרת שדות שאינם לשיתוף, ואכיפת חיסיון עבור משאבים מתויגים. הגורם החיצוני מקבל תגובת FHIR תקנית ואינו חשוף ללוגיקת הסינון. ראו פירוט בדף [הנחיות](guidelines.html).

---

### תהליך מקצה לקצה

1. Autolab שולח מסר HL7 V2 אל HealthConnect
2. HealthConnect מזהה את סוג המסר ומפעיל FUME Plugin עם מפת ההמרה המתאימה
3. FUME קורא ConceptMaps ומפות המרה משרת ה-FHIR
4. FUME מבצע המרה ומחזיר FHIR Bundle
5. HealthConnect שולח את הבאנדל לשרת ה-FHIR כ-POST
6. השרת מאמת מול IL Core ופרופילי הארגון ושומר את המשאבים

</div>
