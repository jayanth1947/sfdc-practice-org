trigger AccountBeforeInsertTrigger on Account (before insert) {

    if(Trigger.isBefore &&Trigger.isInsert){
        AccountBeforeInsertHandler.updateRating(Trigger.new);
    }
}