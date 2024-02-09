trigger updateCaseStatusTrigger on Case (before insert) {
    if(Trigger.isInsert && Trigger.isBefore){
        updateCaseStatusHandler.updateCaseStatus(Trigger.new);
    }
}