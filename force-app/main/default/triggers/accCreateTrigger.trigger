trigger accCreateTrigger on Account (before insert,after insert) {
   
     if(Trigger.isBefore && Trigger.isInsert){
        AccountHandler.createContact(Trigger.new);
    }
}