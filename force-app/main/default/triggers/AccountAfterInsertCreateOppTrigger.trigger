trigger AccountAfterInsertCreateOppTrigger on Account (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        AccountAfterInsertCreateOppHandler.createOpportunity(Trigger.new);
    }
}