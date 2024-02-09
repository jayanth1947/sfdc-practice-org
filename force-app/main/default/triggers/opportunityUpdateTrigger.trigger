trigger opportunityUpdateTrigger on Opportunity (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        oppTriggHandler.updateStage(Trigger.new);
    }
    
}