trigger OpportunityBeforeInsertPreventTrigger on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        OpportunityBeforeInsertPreventHandler.preventUser(Trigger.new);
    }
}