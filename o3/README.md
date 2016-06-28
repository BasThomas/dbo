# Opdracht 3

Omdat het in `MySQL` niet zomaar mogelijk is (http://stackoverflow.com/questions/11127943/connect-to-web-service-api-in-mysql) zonder gebruik te maken van een aparte library en eigen functions, heb ik besloten dit in PHP te schrijven.

De SOAP-message is als volgt opgebouwd:

```xml
<?xml version="1.0"?>
<soap:Envelope
 xmlns:soap="http://www.w3.org/2001/12/soap-envelope"
 soap:encodingStyle="http://www.w3.org/2001/12/soap-encoding">
 <soap:Header>
  ...
 </soap:Header>
 <soap:Body>
  ...
  <soap:Fault>
   ...
  </soap:Fault>
 </soap:Body>
</soap:Envelope>
```

Het is daarna mogelijk om de data, die via PHP is opgehaald, in een database te verwerken.