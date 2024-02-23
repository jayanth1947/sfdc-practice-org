trigger AccountUndeleteTrigger on Account (after undelete) {

    if(Trigger.isAfter && Trigger.isUndelete){
        AccountUndeleteHandler.updateAccountName(Trigger.new);
    }
}