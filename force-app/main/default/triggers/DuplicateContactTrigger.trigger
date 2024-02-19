trigger DuplicateContactTrigger on Contact (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        DuplicateContactHandler.checkDuplicateContacts(Trigger.new);
    }
}