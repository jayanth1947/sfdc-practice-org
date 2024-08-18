trigger OpportunityBeforeInsUpdTrigger on Opportunity (before insert,before update) {

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            OpportunityBeforeInsUpdHandler.updateDescription(Trigger.new,null);
        }
        else if(Trigger.isUpdate){
            OpportunityBeforeInsUpdHandler.updateDescription(Trigger.new,Trigger.oldMap);
        }
    }
}