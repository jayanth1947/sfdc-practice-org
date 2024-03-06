trigger AccountBillingAddressBeforeInsertTrigger on Account (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        AccountBillingAddressBeforeInsertHandler.updateShippingAddress(Trigger.new);
    }
}