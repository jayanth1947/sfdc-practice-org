trigger AccountAfterUpdateRelOppTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        AccountAfterUpdateRelOppHandler.updateOppStage(Trigger.new, Trigger.oldMap);
    }
}