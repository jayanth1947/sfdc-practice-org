trigger SendEmailToAccountOwnerTrigger on Contact (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        SendEmailToAccountOwnerHandler.sendEmailToAccOwner(Trigger.new,Trigger.oldMap);
    }
}