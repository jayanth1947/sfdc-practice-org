trigger opportunutyTriggerPractice on Opportunity (before insert,after insert,before update,after update,before delete) {

    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            opportunutyTriggerPracticeHandler.updateDescription(Trigger.New);
        }
        else if(Trigger.isUpdate){
            opportunutyTriggerPracticeHandler.updateOppDescription(Trigger.New,Trigger.oldMap);
        }
        else if (Trigger.isDelete) {
            opportunutyTriggerPracticeHandler.preventDeleteOpp(Trigger.Old);
        }
    }

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            opportunutyTriggerPracticeHandler.updateAmount(Trigger.New);
        }
        else if (Trigger.isUpdate) {
            opportunutyTriggerPracticeHandler.createTask(Trigger.New,Trigger.oldMap);
        }
    }
}