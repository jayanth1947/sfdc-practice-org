trigger OppDeleteAndCreateTaskTrigger on Opportunity (after delete) {

    if(Trigger.isAfter && Trigger.isDelete){
        OppDeleteAndCreateTaskHandler.createTask(Trigger.old);
    }
}