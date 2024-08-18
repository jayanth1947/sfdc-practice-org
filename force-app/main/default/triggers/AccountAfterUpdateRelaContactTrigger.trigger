trigger AccountAfterUpdateRelaContactTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        AccountAfterUpdateRelaContactHandler.updateMailingAddress(Trigger.new, Trigger.oldMap);
    }
}