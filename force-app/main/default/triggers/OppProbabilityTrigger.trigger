trigger OppProbabilityTrigger on Opportunity (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        OppProbabilityHandler.updateProbability(Trigger.new);
    }
}