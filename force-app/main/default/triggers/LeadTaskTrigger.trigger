trigger LeadTaskTrigger on Lead (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        LeadTaskHandler.createTaskRec(Trigger.new);
    }
    
}