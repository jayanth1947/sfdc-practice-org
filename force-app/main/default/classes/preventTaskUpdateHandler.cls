public class preventTaskUpdateHandler {

    public static void preventTaskUpdate(List<Task> tasList){
        
        List<Id> contactIds=new List<Id>();
        Map<Id,Id> conAccountMap=new Map<Id,Id>();
        Map<Id,Id> accMap=new Map<Id,Id>();
        
        for(Task tas:tasList){
            //To check whoId is Contact or Lead
            if(String.valueOf(tas.whoId).startsWith('003')){
               	contactIds.add(tas.WhoId);
            	conAccountMap.put(tas.Id,tas.WhoId); 
            } 
        }
        
        //Retriving account records which are having contacts with tasks
        Map<Id,Account> accConMap= new  Map<Id,Account>([SELECT Id,Task_Permission__c FROM Account WHERE ID IN (SELECT AccountId FROM Contact WHERE Id IN:contactIds)]);
        
        List<Contact> conList=[SELECT AccountId FROM Contact WHERE Id IN: contactIds];
        
        for(Contact con:conList){
            accMap.put(con.Id,con.AccountId);
        }
        
        for(Task tas:tasList){
            if(!accConMap.get(accMap.get(conAccountMap.get(tas.Id))).Task_Permission__c){
                tas.addError('You can not update this task');
            }
        }
        
    }
}