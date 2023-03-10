global with sharing class openCageAPI {
    public static void forwardEndPoint(Id recordId){
       /*Firstly we need to define the Endpoint and the API key
         inside the code and it should be as follows
         System.Label.NameOfEndpoint*/
        
        String endPoint=System.Label.OpenCageEndPoint; //Mandatory
        String apiKey=System.Label.OpenCageKey; 	  //Mandatory
        String errorMessage=''; 				 	  //Optional
        Account acc=[select Id, ShippingStreet,ShippingCity,ShippingState from Account where Id=:recordId];
        
        String address=acc.ShippingStreet+', '+acc.ShippingCity+', '+acc.ShippingState;
        String encodedString=EncodingUtil.urlEncode(address, 'UTF-8'); //Encoding the data
        
        //This is the finalEndpoint URL
        String finalEndPoint=endPoint+'q='+encodedString+'&key='+apiKey+'&pretty=1';
        
        //New Http request has to be set to make the request and Response
        
        Http htp=new Http(); //New http reference Object is created
        HttpRequest htpReq= new HttpRequest(); //Request to the server
        
        htpReq.setMethod('GET'); //Method that need to be passed here, either it is GET,PUT or POST.....
        
        htpReq.setEndpoint(finalEndPoint); //After the request successful the final endpoint is starts executing
        
        htpReq.setHeader('Content-Type', 'application/json'); //Requesting for the headers
        
         HttpResponse response=new HttpResponse();//Response from the server is stored
        
        try{
            //Here the request has to be send and the response is stored in the response 
            response=htp.send(htpReq);
            //Checking if the code is Satisified or not 
            if(response.getStatusCode()==200){
                String body=response.getBody();
                
                //Print the body 
                System.debug('Body'+body);
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
    public static void reverseGeoCoding(Id recordId){
        String endPoint = System.Label.OpenCageEndpoint;
        String apiKey = System.Label.OpenCageKey;
        String errorMessage ='';
        
        Account acc = [Select id, name, Location__latitude__s, Location__longitude__s, ShippingStreet, ShippingCity, ShippingCountry, ShippingState, 
                       ShippingPostalCode From Account where Id=: recordId];
        String latlng = acc.Location__latitude__s+','+acc.Location__longitude__s;
        String encodedString = EncodingUtil.urlEncode(latlng, 'UTF-8');
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        String finalEndpoint = endPoint +'q='+ encodedString +'&key='+ apiKey +'&pretty=1&limit=1';
        req.setEndpoint(finalEndpoint);
        req.setHeader('Content-Type', 'application/json');
        HttpResponse res = new HttpResponse();
        
        try{
            res = h.send(req);
            if(res.getStatusCode()==200){
                System.debug('response'+ res.getBody());
                            }
            else{
                System.debug('Error in calling opencage api'+ res); 
            } 
        }catch(Exception e){
            System.debug('Error in calling opencage api'+ e.getMessage());
        }
    }
}