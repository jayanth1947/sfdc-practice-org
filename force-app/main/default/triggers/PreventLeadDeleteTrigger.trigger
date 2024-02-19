trigger PreventLeadDeleteTrigger on Lead (before delete) {

    if(Trigger.isBefore && Trigger.isDelete){
        PreventLeadDeleteHandler.preventLeadDelete(Trigger.old);
    }
    
}