public class locationTriggerHandler {
    
    //with the help of recordId we can able to see  what the city,state,Country,pincode
    @future(callout=true) //unless we can make a call out is true we can't make a callout
    public static void verifyAddress(String recordId){
        Location__c loc=[select Id,Name,Street__c,City__c,State__c,Country__c,Postal_Code__c from Location__c where Id=:recordId];
        
        //prepare the request
        //https://www.smarty.com/products/apis/us-street-api?auth-id=f0498b44-bf99-3700-81df-a48b25b9aeca&auth-token=5F34FCVtPC8clI9xE4Af&candidates=10&street=&city=&state=&zipcode=&match=enhanced&license=us-rooftop-geocoding-cloud&method=get
        //https://us-street.api.smartystreets.com/street-address?auth-id=f0498b44-bf99-3700-81df-a48b25b9aeca&auth-token=5F34FCVtPC8clI9xE4Af
        String baseURL='https://us-street.api.smartystreets.com/street-address?auth-id=f0498b44-bf99-3700-81df-a48b25b9aeca&auth-token=5F34FCVtPC8clI9xE4Af';
        baseURL+='&street='+EncodingUtil.urlDecode(loc.Street__c,'UTF-8') 
            +'&city='+EncodingUtil.urlDecode(loc.City__c,'UTF-8')
            +'&state='+EncodingUtil.urlDecode(loc.State__c,'UTF-8')
            +'&zipcode='+EncodingUtil.urlDecode(loc.Postal_Code__c,'UTF-8')
            +'&match=invalid&candidates=10';
         Http htp=new Http();
        HttpRequest htpreq=new HttpRequest();
        htpreq.setMethod('GET');
        htpreq.setHeader('Content-Type','application/json' );
        htpreq.setEndpoint(baseURL);
        
       
        
        HttpResponse response=new HttpResponse();
        
        try{
            response=htp.send(htpReq);
            if(response.getStatusCode()==200 && response.getStatus()=='OK'){
                String responseBody=response.getBody();
                if(!String.isBlank(responseBody) && responseBody.length()>2){
                    loc.Verified__c=true;
                }
                else{
                    loc.Verified__c=false;
                }
            }
            else{
                TransactionLogHandler.doHandleExceptionError(response.getBody(),'LocationTriggerHandler'); 
            }
        }
        catch(System.CalloutException ex){
            TransactionLogHandler.doHandleException(ex,'LocationTriggerHandler');
        }
        
        
    }

}