trigger ContactPreventionTrigger on Contact (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        ContactPreventionHandler.preventUserForContact(Trigger.new);
    }
}