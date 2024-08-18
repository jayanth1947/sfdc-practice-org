trigger updateOppClosedDateTrigger on Opportunity (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        updateOppClosedDateHandler.updateClosedDate(Trigger.new);
    }
}