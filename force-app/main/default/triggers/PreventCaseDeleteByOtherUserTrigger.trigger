trigger PreventCaseDeleteByOtherUserTrigger on Case (before delete) {

    if(Trigger.isBefore && Trigger.isDelete){
        PreventCaseDeleteByOtherUserHandler.preventOtherUserToDelete(Trigger.old);
    }
}