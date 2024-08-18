
trigger orderTrigger on New_Order__c (after insert,after update) {

    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            orderTriggerHandler.onAfterUpdate(Trigger.new);
        }
    }
}