trigger AccountAfterUpdateTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        AccountAfterUpdateHandler.updateRelContactPhone(Trigger.new, Trigger.oldMap);
    }
}