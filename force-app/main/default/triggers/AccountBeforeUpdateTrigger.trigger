trigger AccountBeforeUpdateTrigger on Account (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        AccountBeforeUpdateHandler.updateDescription(Trigger.new,Trigger.oldMap);
    }
}