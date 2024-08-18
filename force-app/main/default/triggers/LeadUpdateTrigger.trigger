// Whenever a Lead is updated and Industry is HealthCare, Set Lead Source as Purchased List, SIC Code as ‘1100’ , Primary as ‘Yes’
trigger LeadUpdateTrigger on Lead (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        for(Lead lea:Trigger.new){
            if(lea.Industry=='Healthcare'){
                lea.LeadSource='Purchased';
                lea.SICCode__c='1100';
                lea.Primary__c='Yes';
            }
        }
    }
}