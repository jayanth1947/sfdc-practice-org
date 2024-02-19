public class OpportunityTaskHandler {

    public static void createTask(List<Opportunity> oppList){
        List<Task> taskList=new List<Task>();
        
        for(Opportunity opp:oppList){
            if(opp.StageName=='Closed Won'){
                Task tas=new Task();
                tas.Subject='Split Revenue';
                tas.Description='Please Split the Revenue among the Team Members';
                tas.Priority='High';
                tas.Status='Not Started';
                tas.WhatId=opp.Id;
                taskList.add(tas);
            }
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}