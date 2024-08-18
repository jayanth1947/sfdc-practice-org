trigger OpportunityAfterInsertTrigger on Opportunity (after insert) {

    if(Trigger.isInsert && Trigger.isAfter){
        OpportunityAfterInsertHandler.populateAmountOnAccount(Trigger.new);
    }
}