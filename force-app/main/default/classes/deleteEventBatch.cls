//This batch class can have global or public access not a private access
global class deleteEventBatch implements Database.Batchable<sObject> {
    
	//There are three methods that are defined in the batch class 
	//First will be start method and has one return type    
    global Database.QueryLocator start(Database.BatchableContext batchContext){
         String Query='select Id,Name from Event__c where Live__c=true AND End_Date_Time__c<LAST_N_MONTHs:2';
        return Database.getQueryLocator(Query);
    }
    
    //execute method runs as the number of chunks are executed 
    global void execute(Database.BatchableContext batchContext,List<Event__c> eventList){
        
        //first it will check whether the list will be empty or not
        if(!eventList.isEmpty()){
            
            //Here the deleteResukt is stored in the form of a list
            List<Database.DeleteResult> deleteResult=Database.delete(eventList);
            for(Database.DeleteResult dr:deleteResult){
                if(!dr.isSuccess()){
                    List<Database.Error> errors=dr.getErrors();
                    
                    //Any errors will occur it will collect here
                    String errorString=String.join(errors,',');
                    TransactionLogHandler.doHandleExceptionError(errorString, 'Developer Console');
                }
            }
        }
        
    }
    global void finish(Database.BatchableContext batchContext){
        
        //Email will be sent at the last execution
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSubject('Event Batch Class ');
            List<String> toAddress = new List<String>();
            toAddress.add('jayanthonteru111@gmail.com');
            mail.setToAddresses( toAddress );
            mail.setSenderDisplayName('Jayanth Organizer');
            mail.setHtmlBody('Event Batch class has been executed');
            
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage> {mail});
            
        
    }

}