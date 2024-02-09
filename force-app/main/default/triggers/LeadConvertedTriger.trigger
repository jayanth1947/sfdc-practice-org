trigger LeadConvertedTriger on Lead (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        LeadConvertedHandler.updateConverted(Trigger.new);
    }
}