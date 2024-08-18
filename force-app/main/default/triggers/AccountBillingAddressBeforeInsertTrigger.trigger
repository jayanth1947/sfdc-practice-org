trigger AccountBillingAddressBeforeInsertTrigger on Account (before insert,before update) {

    if(Trigger.isBefore && Trigger.isInsert){
        AccountBillingAddressBeforeInsertHandler.updateShippingAddress(Trigger.new,null);
    }
    else if(Trigger.isBefore && Trigger.isUpdate){
       AccountBillingAddressBeforeInsertHandler.updateShippingAddress(Trigger.new,Trigger.oldMap); 
    }
}