trigger AccountAfterInsertTrigger on Account (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        AccountAfterInsertHandler.createContact(Trigger.new);
    }
}