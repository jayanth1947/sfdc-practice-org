public class OpportunityTaskHandler {

    public static void createTask(List<Opportunity> oppList){
        List<Task> taskList=new List<Task>();
        
        List<Id> oppIds=new List<Id>();
        
        List<OpportunityTeamMember> deleteTeamMembersIds=new List<OpportunityTeamMember>();
        
        for(Opportunity opp:oppList){
            oppIds.add(opp.Id);
        }
        
        List<OpportunityTeamMember> oppTeamList=[SELECT Id, OpportunityId FROM OpportunityTeamMember WHERE OpportunityId IN: oppIds];
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
            else if(opp.StageName=='Closed Lost'){
                for( OpportunityTeamMember oppTeamMem:oppTeamList){
                    if(oppTeamMem.OpportunityId ==opp.Id){
                        deleteTeamMembersIds.add(oppTeamMem);
                    }
                }
            }
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
        else if(!deleteTeamMembersIds.isEmpty()){
            delete deleteTeamMembersIds;
        }
    }
}