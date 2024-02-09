public class TaskEarlier {

    public static String findEarlyTask(){
        
        List<Task__c> taskList=[SELECT Id,Name,Subject__c,Due_Date__c FROM Task__c ORDER BY Due_Date__c ASC LIMIT 1];
        
        if(!taskList.isEmpty()){
            System.debug(taskList[0].Subject__c);
            return taskList[0].Subject__c;
        }
        else{
            System.debug('No Early Tasks Found');
            return 'No Early Tasks Found';
        }
    }
}