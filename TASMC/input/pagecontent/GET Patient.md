## GET Patient

<div dir="rtl">

הסעיף רלוונטי רק במקרה שה-Client שולף מראש את ה- Patient באמצעות GET Patient.
מבנה השאילתה:
GET [BaseURL]/Patient?identifier=http://fhir.health.gov.il/identifier/il-national-id|[tz]
בתגובה יתקבל Bundle מסוג searchset על פי פרופיל: t17-bundle-search-pat, אשר יכיל את המטופל המבוקש.
השליפה נעשית באמצעות GET למטופל, על פי מספר תעודת זהות.
יש להשתמש בפרמטר החיפוש identifier, ובו לציין את מערכת הזיהוי ואחריה הסימן | אשר מפריד בינה לבין תעודת הזהות. שימו לב, תעודת זהות חייבת להכיל 9 ספרות בדיוק, ועל ה- Client להשלים אפסים מובילים במידת הצורך.
לדוגמה:
GET
* ניתן להפעיל את הפניה הנ"ל בכדי לצפות במבנה ה- Bundle שחוזר.
בכדי לחלץ את ה- logical_id יש לשלוף את הערך שבנתיב הבא:  entry.resource.id עבור כל תוצאה, כלומר שליפה על פי כמות האיברים המוחזרים ב- Bundle.

</div>


![תרשים 1](../assets/img/image8.png)


![תרשים 2](../assets/img/image1.png)


![תרשים 3](../assets/img/image3.png)


![תרשים 4](../assets/img/image2.png)


![תרשים 5](../assets/img/image4.png)


![תרשים 6](../assets/img/image5.png)


![תרשים 7](../assets/img/image6.png)


![תרשים 8](../assets/img/image7.png)


![תרשים 9](../assets/img/image10.png)


![תרשים 10](../assets/img/image11.png)


![תרשים 11](../assets/img/image12.png)


![תרשים 12](../assets/img/image13.png)


![תרשים 13](../assets/img/image14.png)


![תרשים 14](../assets/img/image9.png)


![תרשים 15](../assets/img/image15.png)


![תרשים 16](../assets/img/image16.png)


![תרשים 17](../assets/img/image17.png)


![תרשים 18](../assets/img/image18.png)
