public class orderManagementTriggerHandler {
    public static  Set<String> shippedOrderNumSet { get; set;} 

    public orderManagementTriggerHandler(Set<String> orderNumSet){
        shippedOrderNumSet=new Set<String>();
        shippedOrderNumSet=orderNumSet;
    }

    public  void updateOrderStatus() {
        List<Task> taskList = new List<Task>();
        List<New_Order__c> orderList = new List<New_Order__c>([SELECT Id,Name,Status__c FROM New_Order__c
                                                                WHERE Name IN :shippedOrderNumSet]);

        if (!orderList.isEmpty()) {
            User loggerUser=[SELECT Id,Name FROM User WHERE Username='vtu1358@veltech.edu.in' LIMIT 1];

            for (New_Order__c orderRec : orderList) {
                orderRec.Status__c='Shipped';

                taskList.add(new Task(Priority='Medium', Status='New',Subject='Follow up on Delivery', OwnerId=loggerUser.Id,WhatId=orderRec.Id));
            }
        }

        update orderList;
        insert taskList;
    }
        
    
}