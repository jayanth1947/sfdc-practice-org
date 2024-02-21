public class UpdateNoOfTasksOnContactHandler {
    
    public static void updateTasksNumber(List<Task> newTaskList){
        //Creating collections for the ids and countvalue
        List<Id> ContactIdsList=new List<Id>();
        Map<Id,Integer> conCountMap=new Map<Id,Integer>();
        
        for(Task tas:newTaskList){
            //Converting Id to String
            if(String.valueOf(tas.WhoId).startsWith('003')){
                
                ContactIdsList.add(tas.WhoId);
                //checking for the contact id in the task
                if(conCountMap.containsKey(tas.WhoId)){
                    
                    //Incrementing the count by 1 
                    Integer countVar=conCountMap.get(tas.WhoId) + 1;
                    conCountMap.put(tas.WhoId,countVar);
                }
                else{
                    conCountMap.put(tas.WhoId,1);
                }
            }
            
        }
        
        //Getting the contact records which are associated with the task
        List<Contact> conList=[SELECT Id,No_of_Tasks__c FROM Contact WHERE Id IN:ContactIdsList];
        
        List<Contact> conToUpdate=new  List<Contact>();
        
        for(Contact con:conList){
            if(con.No_of_Tasks__c!=null){
                System.debug('Condition 3 is satisfied');
                //updating this field as the no of tasks that are associated with the contact record
                con.No_of_Tasks__c=con.No_of_Tasks__c + conCountMap.get(con.Id);
            }
            else{
                con.No_of_Tasks__c = conCountMap.get(con.Id);
            }
            conToUpdate.add(con);
        }
        
        
        if(!conToUpdate.isEmpty()){
            update conToUpdate;
        }
    }
}