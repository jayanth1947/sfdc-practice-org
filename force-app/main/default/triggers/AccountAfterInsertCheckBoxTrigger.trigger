trigger AccountAfterInsertCheckBoxTrigger on Account (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        AccountAfterInsertCheckBoxHandler.createContactAndOpportunity(Trigger.new);
    }
}