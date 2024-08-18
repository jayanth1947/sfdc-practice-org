trigger OppNextStepTrigger on Opportunity (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        OppNextStepHandler.updateNextStep(Trigger.new);
    }
}