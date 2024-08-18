trigger preventTaskUpdateTrigger on Task (before update) {

    if(Trigger.isBefore && Trigger.isUpdate){
        preventTaskUpdateHandler.preventTaskUpdate(Trigger.new);
    }
    
}