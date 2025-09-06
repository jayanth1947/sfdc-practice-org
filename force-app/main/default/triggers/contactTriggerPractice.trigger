trigger contactTriggerPractice on Contact (after insert,before insert,before update) {

    if (Trigger.isInsert) {
        if (Trigger.isAfter) {
            contactTriggerPracticeHandler.createAccount(Trigger.New);
        }
        else if(Trigger.isBefore){
            contactTriggerPracticeHandler.mandateEmailAndPhone(Trigger.New);
            contactTriggerPracticeHandler.contactAssignToAccount(Trigger.New);
        }
    }
    else if(Trigger.isUpdate){
        if (Trigger.isBefore) {
            contactTriggerPracticeHandler.mandateEmailAndPhone(Trigger.New);
            contactTriggerPracticeHandler.contactAssignToAccount(Trigger.New);
        }
        
    }

}