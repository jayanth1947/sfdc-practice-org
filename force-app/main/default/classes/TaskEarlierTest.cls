@isTest
public class TaskEarlierTest {
    
    @isTest
    static void checktasks(){
        List<Task__c> taskList=new List<Task__c>();
        if(!taskList.isEmpty()){
            for(Integer i=1;i<=50;i++){
                Task__c tas=new Task__c();
                tas.Name='New task '+i;
                tas.Subject__c='Task Update';
                tas.Due_Date__c=system.today()-4;
                taskList.add(tas);
            }
            Test.startTest();
            insert taskList;
            
            TaskEarlier.findEarlyTask();
            List<Task__c> newtaskList=[SELECT Id,Name,Subject__c,Due_Date__c FROM Task__c ORDER BY Due_Date__c ASC LIMIT 1];
            if(!taskList.isEmpty()){
                for(Task__c tas:newtaskList){
                    System.debug(tas.Subject__c);
                    System.assertEquals('Task Update',tas.Subject__c);
                }
            }
            Test.stopTest();
        }
        
        else{
            String result = TaskEarlier.findEarlyTask();
            System.assertEquals('No Early Tasks Found', result);
        }
    }
}