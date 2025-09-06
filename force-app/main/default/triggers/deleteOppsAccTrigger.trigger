trigger deleteOppsAccTrigger on Account (after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        accTriggerHandler.deleteOpps(Trigger.New,Trigger.oldMap);
    }
}