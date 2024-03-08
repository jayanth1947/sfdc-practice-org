@isTest
public with sharing class OpportunityTaskHandlerTest {
    @isTest
    static void OpportunityTaskHandlerCloseWon() {
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        
        for(Opportunity opp:oppList){
            opp.StageName='Closed Won';
        }
        
        update oppList;
        Test.stopTest();
        
        List<Task> taskList=[SELECT Id,Subject FROM Task WHERE WhatId =:oppList[0].Id];
        
        Assert.isTrue(taskList!=null,'Task records created');
        
    }
    
    @isTest
    static void OpportunityTaskHandlerCloseLost(){
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        
        List<OpportunityTeamMember> teamList=new List<OpportunityTeamMember>();
        for(Opportunity opp:oppList){
            OpportunityTeamMember testTeamMember = new OpportunityTeamMember(
                OpportunityId = opp.Id,
                UserId = UserInfo.getUserId()
            );
            teamList.add(testTeamMember);
        }
        
        insert teamList;
        for(Opportunity opp:oppList){
            
            opp.StageName='Closed Lost';
            opp.Close_Reason__c='Lost: Company Budget Constraints';            
        }
        
        update oppList;
        Test.stopTest();
        
        List<OpportunityTeamMember> deletedTeamMembers = [SELECT Id FROM OpportunityTeamMember WHERE Id = :teamList[0].Id];
        System.assertEquals(0, deletedTeamMembers.size(), 'Expected OpportunityTeamMember to be deleted');
    }
    
}