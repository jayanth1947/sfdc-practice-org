public class OpportunityAfterUpdateRelaContactHandler {

    public static void createTaskRec(List<Opportunity> oppList,Map<Id,Opportunity> oldOppMap){
     
        List<Task> taskList=new List<Task>();
        for(Opportunity opp:oppList){
            if(opp.StageName!=null && opp.StageName!=oldOppMap.get(opp.Id).StageName){
                Task tas=new Task();
                tas.Subject='New Task for Opportunity';
                tas.Status='Not Started';
                tas.Priority='Normal';
                tas.WhatId=opp.Id;
                tas.OwnerId=opp.OwnerId;
                taskList.add(tas);
            }
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}