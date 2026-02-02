## GET Coverage & Related Document

<div dir="rtl">

GET ל- Coverage לקבלת פרטי ההתחייבות, על בסיס ה- id של ה- Coverage כפי שהתקבל בסעיף הקודם*:
GET [server]/Coverage?_id=[resource_id]&_revinclude=DocumentReference:related
*ה- Coverage.id מתקבל באלמנט: CoverageEligibilityResponse.insurance.coverage.reference
שהמבנה שלו הוא: Coverage/<id>
יש לשים לב – פעולה זו מחזירה Bundle מכיוון שמדובר בחיפוש.
דוגמה לקריאה:
GET http://hapi-fhir.outburn.co.il/fhir/Coverage?_id=4639&_revinclude=DocumentReference:related

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
