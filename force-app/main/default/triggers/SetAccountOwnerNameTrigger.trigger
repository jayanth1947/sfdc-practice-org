trigger SetAccountOwnerNameTrigger on Account (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        SetAccountOwnerNameHandler.updateOwnerOnAccount(Trigger.new);
    }
}