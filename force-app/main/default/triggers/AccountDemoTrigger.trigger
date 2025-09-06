// This is a trigger on the Account object that will execute before and after insert events
trigger AccountDemoTrigger on Account (before insert,after insert,before update,after update,after delete) {
    // Check if the trigger is executing before insert
    if(Trigger.isInsert){
        // If it is before insert, call the beforeInsert method of AccountDemohandler class and pass the new records as a parameter
        if(Trigger.isBefore){
            AccountDemohandler.beforeInsert(Trigger.new);
        }
        
        // If it is after insert, call the afterInsert method of AccountDemohandler class and pass the new records as a parameter
        else if(Trigger.isAfter){
         AccountDemohandler.afterInsert(Trigger.new);   
        }
    }
    if(Trigger.isUpdate){
       if(Trigger.isBefore){
            AccountDemohandler.updatePhoneDescription(Trigger.new,Trigger.oldMap);
        }
    
            else if(Trigger.isAfter){
         AccountDemohandler.populateRelatedOpp(Trigger.new,Trigger.oldMap);   
        } 
    }
    if(Trigger.isAfter && Trigger.isDelete){
        
            AccountDemohandler.deleteEmployees(Trigger.old);
        
    }    
    
    
}