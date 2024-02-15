trigger accountOwnerChangeTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        accountOwnerChangeTriggerHandler.afterUpdate(Trigger.oldMap,Trigger.newMap);
    }
}