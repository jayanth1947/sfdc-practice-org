trigger employeeTrigger on Employee__c (before delete) {
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            employeeTriggerHandler.checkEmployeeStatus(Trigger.Old);
        }
        else if(Trigger.isAfter){
            
        }
    }
}