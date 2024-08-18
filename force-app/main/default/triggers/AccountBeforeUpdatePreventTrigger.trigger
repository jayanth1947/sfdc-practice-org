trigger AccountBeforeUpdatePreventTrigger on Account (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        AccountBeforeUpdatePreventHandler.preventEditOfAccount(Trigger.new);
    }
}