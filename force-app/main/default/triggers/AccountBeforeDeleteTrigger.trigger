trigger AccountBeforeDeleteTrigger on Account (before delete) {

    if(Trigger.isBefore && Trigger.isDelete){
        AccountBeforeDeleteHandler.preventDeletion(Trigger.old);
    }
}