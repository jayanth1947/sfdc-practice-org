trigger OpportunityTaskTrigger on Opportunity (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTaskHandler.createTask(Trigger.new);   
    }
}