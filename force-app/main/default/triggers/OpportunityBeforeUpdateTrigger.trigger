trigger OpportunityBeforeUpdateTrigger on Opportunity (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        OpportunityBeforeUpdateHandler.populateClosedReason(Trigger.new,Trigger.oldMap);
    }
}