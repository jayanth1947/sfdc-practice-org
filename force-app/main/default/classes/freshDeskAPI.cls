global class freshDeskAPI {
    public static final String ticket_endpoint='api/v2/tickets';
    public static final String contact_endpoint='api/v2/contacts';
    
    public static void createContact(String name,String email,String phone,String mobile){
    
    String errorMessage='';
    String endPoint=contact_endpoint;
    
    String cred=System.Label.freshdesk;
    
    String requestBody='{'+
        '"name":"'+name+'",'+
        '"email":"'+email+'",'+
        '"phone":"'+phone+'",'+   
        '"mobile":"'+mobile+'"'+
        '}';
        Http htp=new Http(); 
        HttpRequest htpReq= new HttpRequest(); //Request to the server
        
        htpReq.setMethod('POST'); 
     
    //htpReq.setHeader('Authorization', 'Basic '+EncodingUtil.base64Encode(Blob.valueOf(cred))); //Requesting for the headers
    htpReq.setEndpoint('callout:FreshDesk/api/v2/contacts');
    htpReq.setBody(requestBody);

    htpReq.setHeader('Content-Type', 'application/json');
         HttpResponse response=new HttpResponse();//Response from the server is stored
     try{
            //Here the request has to be send and the response is stored in the response 
            response=htp.send(htpReq);
            //Checking if the code is Satisified or not 
            if(response.getStatusCode()==200){
                String responseBody=response.getBody();
                
                //Print the body 
                System.debug('Body'+responseBody);
            }
            else{
                errorMessage='Unexpected Error'+response.getStatus()+ 'status code is'+response.getStatusCode();
                System.debug(errorMessage);
            }
            
        }
        
        catch(System.Exception e){
            if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
                
                errorMessage='Unauthorized EndPoint and try to add new remote site settings';
                
                System.debug(errorMessage);
            }
            else{
                errorMessage='Unexpected Error'+response.getStatus()+ 'status code is'+response.getStatusCode();
                System.debug(errorMessage);
            }
            
        }
}
}