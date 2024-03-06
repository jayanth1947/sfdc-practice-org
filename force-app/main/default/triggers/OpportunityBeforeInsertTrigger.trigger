trigger OpportunityBeforeInsertTrigger on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
            OpportunityBeforeInsertHandler.updateDescription(Trigger.new);
    }
}