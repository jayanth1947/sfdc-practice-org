trigger ContactUpdateTrigger on Contact (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        contactTriggHandler.updateEmailField(Trigger.new);
    }
}