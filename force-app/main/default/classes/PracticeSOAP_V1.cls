/* Info about the SOAP request
 * 
 * 
 * /services/Soap/class/namespace/className ||(request url) -- Here 'Soap', 's' should be in caps case
-----------------------------------------------------------------------------------------------------------
Headers in SOAP

Content-Type:text/xml; charset=UTF-8;
Accept: text/xml;
SOAPAction:''; //when we are using thirdparty api we will use soap action

------------------------------------------------------------------------------------------------------------

XML Body

<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:AnyName="http://soap.sforce.com/schemas/class/Namespace/className">
//xml starts and ends with the envelope tag and it also contains two bodies
  1. Header -used to contain the secure information of the user who is consuming the webservice
  -- In header we may pass the usernames or the session headers inside the header tag
  

	<soapenv:Header>
		<jayanth:SessionHeader>
			<jayanth:sessionId>session_Id</jayanth:sessionId>
		</jayanth:SessionHeader>
	</soapenv:Header>

    2> Body - This contains what methods we need to use inside the soap body
    and also contains what need to pass inside the soap body

	<soapenv:Body>

		<jayanth:fullName> --<nameSpace:methodName>
			<jayanth:firstName>Jayanth</jayanth:firstName> --<nameSpace:parameters>
			<jayanth:lastName>Onteru<jayanth:lastName>
		</jayanth:fullName>
	</soapenv:Body>
</soapenv:Envelope>

*/
 
/*
Sample code for the xml body
-----------------------------------------------
<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:jayanth="http://soap.sforce.com/schemas/class/PracticeSOAP_V1">

	<soapenv:Header>
		<jayanth:SessionHeader>
			<jayanth:sessionId>00D5g00000EHrNI!AQYAQCN0NTnq7hXbzAaW0tm1LDF3RqvNhecLpjPdIZBjM7FK79XCUaUqEkITG7FrFvRZ4oO.zhaPlobSjALDJX.9hWsmAaI_</jayanth:sessionId>
		</jayanth:SessionHeader>
	</soapenv:Header>


	<soapenv:Body>

		<jayanth:fullName>
			<jayanth:firstName>Jayanth</jayanth:firstName>
			<jayanth:lastName>Onteru</jayanth:lastName>
		</jayanth:fullName>
	</soapenv:Body>
</soapenv:Envelope>

*/


//Class should be global in SOAP
global class PracticeSOAP_V1 {
    //The method follows the syntax as given below.
    //'webservice static return_type method_Name(parameters...)'
    webservice static String fullName(String firstName,String lastName){
        String message='Welcome' + firstName + ' ' +lastName;
        return message;
    }
    
    //New method for the Account creation
    webservice static Account createAccount(AccountWrapper accRec){
        Account acc=new Account();
        acc.Name=accRec.Name;
        acc.Rating=accRec.Rating;
        acc.Industry=accRec.Industry;
        acc.Phone=accRec.Phone;
        
        insert acc;
        
        return acc;
        

}
   //Wrapper class for the account Record
    global class AccountWrapper{
        webservice String Name;
        webservice String Rating;
        webservice String Industry;
        webservice String Phone;
    }
}