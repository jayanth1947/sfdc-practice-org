trigger OppUpdateAmountTrigger on Opportunity (before update) {
    
    if(Trigger.isBefore && Trigger.isUpdate){
        OppUpdateAmountHandler.updateOppAmount(Trigger.new,Trigger.oldMap);    
    }
    
}