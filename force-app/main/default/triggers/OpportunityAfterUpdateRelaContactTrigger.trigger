trigger OpportunityAfterUpdateRelaContactTrigger on Opportunity (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityAfterUpdateRelaContactHandler.createTaskRec(Trigger.new, Trigger.oldMap);
    }
}