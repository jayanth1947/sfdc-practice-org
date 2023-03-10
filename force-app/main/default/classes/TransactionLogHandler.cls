public class TransactionLogHandler {
    //Creating a exception handler method
    public static void doHandleException(System.Exception ex,String processName){
        //With the help of the errror_log obj we are able to finf the errors and messages will get displayed
        
        
        //
        Error_Log__c transactionLog=new Error_Log__c(
            Log_Details__c=ex.getStackTraceString()+'<br/> <strong> Message is </strong> '+ex.getMessage()
            + '<br/>' +ex.getCause() +'<br/> ' + ex.getTypeName()+' <br/> '+ex.getLineNumber(),
            Log_DateTime__c =System.now(),
            Process_Name__c =processName
        );
        insert transactionLog;
    }
    
    public static void doHandleExceptionError(String error,String processName){
        //With the help of the errror_log obj we are able to finf the errors and messages will get displayed
        
        
        //
        Error_Log__c transactionLog=new Error_Log__c(
            Log_Details__c=error,
            Log_DateTime__c =System.now(),
            Process_Name__c =processName
        );
        insert transactionLog;
    }


}

/*
 Anamymous code
 try{
    integer i=10/0;
}
catch(System.Exception ex){
    TransactionLogHandler.doHandleException(ex, 'Developer Console');
}
*/