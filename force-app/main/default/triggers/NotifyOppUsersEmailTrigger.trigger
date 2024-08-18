trigger NotifyOppUsersEmailTrigger on Opportunity (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        NotifyOppUsersEmailHandler.notifyUsersViaEmail(Trigger.new, Trigger.oldMap);
    }
}