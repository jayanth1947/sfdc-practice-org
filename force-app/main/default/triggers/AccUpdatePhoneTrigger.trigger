trigger AccUpdatePhoneTrigger on Account (after update) {
    
    if(Trigger.isAfter && Trigger.isUpdate){
        AccUpdatePhoneHandler.updatePhonerecords(Trigger.new,Trigger.oldMap);
    }
    
}