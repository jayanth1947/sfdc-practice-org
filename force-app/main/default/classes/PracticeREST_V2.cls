// '@RESTResource' annotation is used for the class to be set in a REST API 
@RESTResource(urlMapping='/v1/Account/*') // * is important if you want to retrive the data with the help of the Id in org
global with sharing class PracticeREST_V2 {            //* means followed by anything
    
    @httpPatch //Updating the information using this patch method
    
    global static ResponseWrapper updateAccount(String rating,String accNumber,String description){
        RestRequest req=RestContext.request;
        String requestURI=req.requestURI;
        String accountId=requestURI.subStringAfterLast('/');
        List<Account> acclist=[SELECT Id from Account where Id=:accountId];
        Account accRec;
        ResponseWrapper wrapper=new ResponseWrapper(); //Creating a wrapper class object
        if(acclist!=null && acclist.size()>0){
            //Creating a new record for the existing once
            accRec=new Account(Id=accountId,Rating=rating,AccountNumber=accNumber,Description=description);
            update accRec;  
            wrapper.accRec=accRec;
            wrapper.message='Account Record updated';
        }
        else{
            wrapper.message='Account Record Not Found';
        }
        return wrapper;
    }
    
    
    @httpDelete
    //This will delete the data 
    
    global static String deleteAccount(){
        RestRequest req=RestContext.request;
        String requestURI=req.requestURI; //URI is a urlMapping in the RestResource line
        String accountId=requestURI.subStringAfterLast('/');	//It will get the Id 
        
        List<Account> acclist=[SELECT Id from Account where Id =:accountId];
        //In the if block it will check whether the data is
        //present in the list or not 
        if(acclist!=null && acclist.size()>0){
            //Try and catch blocks catch the errors when any data is found.
            try{
                delete acclist;
                return '{"message":"Account Record Deleted"}';
            }
            catch(Exception ex){
                String errorMessage=ex.getMessage();
                return '{"message":"'+errorMessage+'""}';
            }
            
        }
        else
            return '{"message":"Account Not Found"}';
        
    }
    
    @httpPost //To send and save the details
    
    global static Account postAccount(String accName, String accNumber, String industry,
                                      String description){
                                          Account accRecord =new Account(Name=accName,AccountNumber=accNumber,Industry=industry, Description=description);
                                          
                                          insert accRecord;
                                          return accRecord;
                                          
                                      }
    /* global static accountInfo postAccount(accountInfo information){
Account accRecord=information.accRecord;
insert accRecord;
Contact conRec=information.conRec;
conRec.AccountId=accRecord.Id;
conRec.Description=information.simpleMessage;
insert conRec;
return information;
} */
    @httpGet // To Get the details we USE GET method
    global static AccountWrapper accountInfo(){
        RestRequest req=RestContext.request;
        String requestURI=req.requestURI; //URI is a urlMapping in the RestResource line
        String accountId=requestURI.subStringAfterLast('/');	//It will get the Id 
        List<Account> accList=[SELECT Id,Name,Rating,Industry from Account where Id=:accountId];
        
        List<Contact> conList=[SELECT Id,firstName,lastName,Email,Phone FROM Contact where AccountId=:accountId];
        
        List<Case> caseList=[SELECT Id,CaseNumber,Subject,Description,Status,Owner.Name from Case where AccountId=: accountId];
        
        AccountWrapper wrapper=new AccountWrapper(); //create a wrapper object
        if(!accList.isEmpty()){
            //Here the data is get retrived 
            wrapper.accountRecord=accList.get(0);
            wrapper.conList=conList;
            wrapper.caseList=caseList;
            
        }
        //The data is returned in the method
        return wrapper;
        
    }
    
    //we are creating a wrapper class which will hold the combined data in a single class
    global class AccountWrapper{
        global account accountRecord;
        global List<Contact> conList;
        global List<Case> caseList;
    }
    //This wrapper class is used for helping in getting the message and the account record that has been updated
    global class ResponseWrapper{
        global Account accRec;
        global String Message;
        
        
    }
}