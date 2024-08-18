public class OppDeleteAndCreateTaskHandler {

    public static void createTask(List<Opportunity> oldOppList){
     
        Set<Id> accIds=new Set<Id>(); //Storing the Opportunity AccountIds
        
        Map<Id,Id> oppMapAccIds=new Map<Id,Id>(); //Storing the Opportunity AccountIds in a Map
        Map<Id,Id> oppMapAccOwnerIds=new Map<Id,Id>(); //Storing the Account Owner Ids in a Map
        
        
        for(Opportunity opp:oldOppList){
            accIds.add(opp.AccountId);
            oppMapAccIds.put(opp.Id,opp.AccountId);
        }
        
        List<Account> accList=[SELECT Id,OwnerId FROM Account WHERE Id IN :accIds]; //Getting the Accounts related to Opportunity
        
        for(Account acc:accList){
            oppMapAccOwnerIds.put(acc.Id,acc.OwnerId);
        }
        
        List<Task> newTaskList=new List<Task>();
        
        for(Opportunity opp:oldOppList){
            Task tas=new Task();
            tas.Subject='Follow Up';
            tas.Status='Not Started';
            tas.OwnerId=oppMapAccOwnerIds.get(oppMapAccIds.get(opp.Id)); //Getting the Opportunity Account OwnerId and assigning to task owner.
            tas.Priority='High';
            tas.Description='Please Investigate';
           
            newTaskList.add(tas);
        }
        
        if(!newTaskList.isEmpty()){
            insert newTaskList;
        }
    }
}