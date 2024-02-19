trigger CreateContactTrigger on Account (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        CreateContactHandler.createContacts(Trigger.new);
    }
}