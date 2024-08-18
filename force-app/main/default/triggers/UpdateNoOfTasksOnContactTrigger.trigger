trigger UpdateNoOfTasksOnContactTrigger on Task (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        UpdateNoOfTasksOnContactHandler.updateTasksNumber(Trigger.new);
    }
}