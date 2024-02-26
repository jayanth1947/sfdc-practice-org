trigger CreateNLocationOnContactTrigger on Contact (after insert,after update) {

    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            CreateNLocationOnContactHandler.createLocationRecords(Trigger.new, Trigger.oldMap);
        }
    }
}