trigger AccountOwnerShipPreventionTrigger on Account (before update) {
    
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountOwnerShipPreventionHandler.preventOwnerShip(Trigger.new,Trigger.oldMap);
    }
}