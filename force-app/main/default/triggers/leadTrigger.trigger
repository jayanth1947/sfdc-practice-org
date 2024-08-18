//Whenever a Lead record is updated, set the Lead status to ‘Working - Contacted’.

trigger LeadTrigger on Lead (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        for(Lead lea:Trigger.new){
            lea.Status='Working-Contacted';
        }
    }
}