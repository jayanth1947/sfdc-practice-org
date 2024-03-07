trigger AccountBeforeInsUpdTrigger on Account (before insert,before update) {

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountBeforeInsUpdHandler.updateRating(Trigger.new,null);
        }
        else if(Trigger.isUpdate){
            AccountBeforeInsUpdHandler.updateRating(Trigger.new,Trigger.oldMap);
        }
    }
}