public with sharing class orderTriggerHandler {

    private static final String READY_TO_SHIP='ready to ship';
    
    public static void onAfterUpdate(List<New_Order__c> newOrders) {
        
         List<Order_Management__e> orderEventList;
        orderEventList=new List<Order_Management__e>();

        for(New_Order__c newOrder:newOrders){
            if (newOrder.Status__c.equalsIgnoreCase(READY_TO_SHIP)) {
                orderEventList.add(new Order_Management__e(Order_Number__c=newOrder.Name,Status__c=1));
            }
        }

        if(!orderEventList.isEmpty()){

            //Publish an event
            List<Database.SaveResult> eventPubResultList = EventBus.publish(orderEventList);

            //Check for published event status
            for (Database.SaveResult eventPubResult : eventPubResultList) {
                if (eventPubResult.isSuccess()) {
                    System.debug('Event Published Successfully '+eventPubResult);
                }

                else {
                    
                    for (Database.Error pubError : eventPubResult.getErrors()) {
                        System.debug('Event Published Failed '+pubError.getStatusCode() + ' ' + pubError.getMessage());
                    }
                }
            }
        }
    }
}