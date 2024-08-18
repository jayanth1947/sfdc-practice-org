trigger updatePhoneLeadSourceTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        updatePhoneLeadSourceHandler.updatePhoneLeadSource(Trigger.new, Trigger.oldMap);
    }
}