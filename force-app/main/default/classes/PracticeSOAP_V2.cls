global class PracticeSOAP_V2 {
    /*

<?xml version="1.0" encoding="UTF-8"?>
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:jayanth="http://soap.sforce.com/schemas/class/PracticeSOAP_V2">

<soapenv:Header>
<jayanth:SessionHeader>
			<jayanth:sessionId>00D5g00000EHrNI!AQYAQCN0NTnq7hXbzAaW0tm1LDF3RqvNhecLpjPdIZBjM7FK79XCUaUqEkITG7FrFvRZ4oO.zhaPlobSjALDJX.9hWsmAaI_</jayanth:sessionId>
		</jayanth:SessionHeader>
	</soapenv:Header>


<soapenv:Body>

<jayanth:createAccount>

<jayanth:accRec>
<jayanth:Name>SOAP API Test-2 </jayanth:Name>
<jayanth:Rating>Hot</jayanth:Rating>
<jayanth:AccountNumber>HTTP2312</jayanth:AccountNumber>
<jayanth:Industry>Agriculture</jayanth:Industry>
<jayanth:Phone>9986283846</jayanth:Phone>

<jayanth:contactRecord>
<jayanth:LastName>SOAP Contact</jayanth:LastName>
</jayanth:contactRecord>

</jayanth:accRec>
</jayanth:createAccount>

	</soapenv:Body>
</soapenv:Envelope>

*/
    
    //New method for the Account creation
    webservice static AccountWrapper createAccount(AccountWrapper accRec){
        
        Account acc=new Account();
        acc.Name=accRec.Name;
        acc.Rating=accRec.Rating;
        acc.Industry=accRec.Industry;
        acc.Phone=accRec.Phone;
        acc.AccountNumber=accRec.AccountNumber;
        insert acc;
        
        Contact con=accRec.contactRecord;
        con.AccountId=acc.Id;
     
        insert con;
        
        return accRec;
        
    }
    //Wrapper class for the account Record
    
    global class AccountWrapper{
        webservice String Name;
        webservice String AccountNumber;
        webservice String Rating;
        webservice String Industry;
        webservice String Phone;
        webservice Contact contactRecord;
    }
}