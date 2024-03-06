trigger caseAfterInsertTrigger on Case (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        caseAfterInsertHandler.updateCaseNumberOnAccount(Trigger.new);
    }
}