trigger shareContactRecordToPublicTrigger on Contact (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        shareContactRecordToPublicHandler.shareContactRecord(Trigger.new);
    }
    
}