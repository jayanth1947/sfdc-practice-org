trigger caseTwoTrigger on Case (after insert,after update,after delete,after undelete) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        caseTriggerTwoHandler.updateRatingOnAccount(Trigger.New,Trigger.oldMap);
    }
    else if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete)) {
        caseTriggerTwoHandler.updateRatingOnAccount(Trigger.New,null);
    }

    else if (Trigger.isAfter && Trigger.isDelete) {
        caseTriggerTwoHandler.updateRatingOnAccount(Trigger.Old,null);
    }
}