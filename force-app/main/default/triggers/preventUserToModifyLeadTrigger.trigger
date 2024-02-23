trigger preventUserToModifyLeadTrigger on Lead (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        preventUserToModifyLeadHandler.checkCreationDateBeforeUpdate(Trigger.new);
    }
}