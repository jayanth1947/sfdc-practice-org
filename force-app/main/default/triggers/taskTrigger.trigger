//Whenever a task is created ,set the priority to High.
trigger taskTrigger on Task (before insert) {

    if(Trigger.isInsert&&Trigger.isBefore){
        for(Task tas:Trigger.new){
            tas.Priority='High';
        }
    }
}