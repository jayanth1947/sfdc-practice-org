trigger orderManagementTrigger on Order_Management__e (after insert) {

    private Set<String> shippedOrderNumber = new Set<String>();

    for (Order_Management__e orderEvent : Trigger.new) {
        if (orderEvent.Status__c==2) {
            shippedOrderNumber.add(orderEvent.Order_Number__c);
        }
    }

    if (!shippedOrderNumber.isEmpty()) {
        new orderManagementTriggerHandler(shippedOrderNumber).updateOrderStatus();  }
}