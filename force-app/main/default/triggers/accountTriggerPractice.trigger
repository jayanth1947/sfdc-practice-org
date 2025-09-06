//Account Trigger to set Account Rating as 'Hot' if Account Industry is Banking or Health Care
trigger accountTriggerPractice on Account (before insert,before update,before delete,after delete,after update,after insert) {

    if(Trigger.isBefore){
        if (Trigger.isInsert || Trigger.isUpdate) {
            accountTriggerPracticeHandler.updateRating(Trigger.New);
            accountTriggerPracticeHandler.assignAnnualRevenue(Trigger.New);
            //accountTriggerPracticeHandler.preventDuplication(Trigger.New);
            accountTriggerPracticeHandler.updateRatingBasedOnIndustry(Trigger.New);
            accountTriggerPracticeHandler.copyBillingToShipping(Trigger.New);
            accountTriggerPracticeHandler.updateDescription(Trigger.New,Trigger.oldMap);
        }
        else if(Trigger.isDelete){
            accountTriggerPracticeHandler.preventAccountDelete(Trigger.Old);
            accountTriggerPracticeHandler.preventAccountDeletecDiffProfile(Trigger.Old);   
            accountTriggerPracticeHandler.preventDeleteAccountRelOppo(Trigger.Old,Trigger.oldMap);
            accountTriggerPracticeHandler.preventDeleteAccountRelCases(Trigger.Old,Trigger.oldMap);
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isDelete) {
            accountTriggerPracticeHandler.deleteAccount(Trigger.oldMap);
        }
        else if(Trigger.isUpdate) {
            accountTriggerPracticeHandler.copyAccountPhoneToRelaContacts(Trigger.New,Trigger.oldMap);
            accountTriggerPracticeHandler.updateRelatedOpportunity(Trigger.New,Trigger.oldMap);
             
        }
        else if (Trigger.isInsert) {
            //accountTriggerPracticeHandler.createContact(Trigger.New);
            //accountTriggerPracticeHandler.createOpportunity(Trigger.New);
            accountTriggerPracticeHandler.createContactAndOpportunity(Trigger.New);
        }
    }
}