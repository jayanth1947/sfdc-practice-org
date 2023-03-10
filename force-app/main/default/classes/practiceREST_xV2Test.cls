@isTest
public class practiceREST_xV2Test {
    
    @isTest
    public static void getAccount(){
        //String recordId=createTestRecord(); //Getting the recordId from the method
        
        //String uri='/services/apexrest/v1/Account/'+recordId;
        
        RestRequest req=new RestRequest();
        ///req.requestURI=uri; //URI is getting intialized here
        req.httpMethod='GET'; // Will give which method we are using for the testing purpose
        
        RestContext.request=req; //Here we are assigning the request to the context calss
        
        
     
        
    }
    
    @isTest
    public static void postAccountTest(){
        String uri='/services/apexrest/v1/Account';
        
        RestRequest req=new RestRequest();
        req.requestURI=uri; //URI is getting intialized here
        req.httpMethod='POST'; // Will give which method we are using for the testing purpose
        
        Account acc=new Account(Name='BoolBerg');
        Contact con=new Contact(firstName='Kiran',lastName='Kullu',Phone='6381935883');
        String simpleMessage='Good day GentleMen! looks you are in the right place';
   
        
                                
        
    }
    

}