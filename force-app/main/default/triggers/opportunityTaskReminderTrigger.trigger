trigger opportunityTaskReminderTrigger on Opportunity (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        opportunityTaskReminderHandler.createTaskReminder(Trigger.new, Trigger.oldMap);
    }
}