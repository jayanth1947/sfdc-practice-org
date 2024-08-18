@isTest
public with sharing class OpportunityTaskHandlerTest {
<<<<<<< HEAD
   /* @isTest
    static void TeseOpportunityTaskHandler() {
=======
    @isTest
    static void OpportunityTaskHandlerCloseWon() {
>>>>>>> 4fd9e0be654618225fd7536209730ac977aace3d
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
<<<<<<< HEAD
            opp.StageName='Closed Won';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        insert oppList;

        Test.startTest();
        OpportunityTaskHandler.createTask(oppList);
        Test.stopTest();
       /* List<Task> taskList = new List<Task>();
        for(Opportunity opp:oppList){
            if (opp.StageName=='Closed Won') {
                Task tas=new Task();
                tas.Subject='Split Revenue';
                tas.Description='Please Split the Revenue among the Team Members';
                tas.Priority='High';
                tas.Status='Not Started';
                tas.WhatId=opp.Id;
                taskList.add(tas);
            }
            else {
                
            }
        } 
    }

    @isTest
    static void TestOpportunityTaskHandler() {
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.StageName='Closed Lost';
            opp.Close_Reason__c ='Lost: Price';
            opp.CloseDate=System.today();
            oppList.add(opp);
        }
        insert oppList;

        Test.startTest();
        OpportunityTaskHandler.createTask(oppList);
        Test.stopTest();
    } */

    @isTest
public class OpportunityTaskHandlerTest {

    @testSetup
    static void createTestData() {
        // Create sample Opportunities with different stages
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            Opportunity opp = new Opportunity(
                Name = 'Test Opportunity ' + i,
                StageName = i % 2 == 0 ? 'Closed Won' : 'Closed Lost'
            );
            insert opp;
            oppList.add(opp);
        }
        
        // Create sample Opportunity Team Members for Closed Won opportunities
        List<OpportunityTeamMember> teamMembers = new List<OpportunityTeamMember>();
        for (Opportunity opp : oppList) {
            if (opp.StageName == 'Closed Won') {
                teamMembers.add(new OpportunityTeamMember(OpportunityId = opp.Id));
            }
        }
        insert teamMembers;
    }

    @test
    public void testCreateTaskForClosedWonOpportunities() {
        // Test processing bulk opportunities
        List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE StageName IN ('Closed Won', 'Closed Lost')];
        OpportunityTaskHandler.createTask(oppList);

        // Assert tasks are created only for Closed Won opportunities
        List<Task> createdTasks = [SELECT Id, Subject, Description FROM Task WHERE WhatId IN : oppList];
        List<String> expectedSubjects = new List<String>();
        List<String> expectedDescriptions = new List<String>();
        for (Opportunity opp : oppList) {
            if (opp.StageName == 'Closed Won') {
                expectedSubjects.add('Split Revenue');
                expectedDescriptions.add('Please Split the Revenue among the Team Members');
            }
        }
        assertEquals(expectedSubjects, createdTasks.Subject);
        assertEquals(expectedDescriptions, createdTasks.Description);

        // Assert no tasks are deleted
        List<Opportu
        nityTeamMember> remainingTeamMembers = [SELECT Id FROM OpportunityTeamMember];
        assertEquals(5, remainingTeamMembers.size());
    }

    @test
    public void testDeleteTeamMembersForClosedLostOpportunities() {
        // Test processing bulk opportunities
        List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE StageName IN ('Closed Won', 'Closed Lost')];
        OpportunityTaskHandler.createTask(oppList);

        // Assert OpportunityTeamMembers are deleted only for Closed Lost opportunities
        List<OpportunityTeamMember> remainingTeamMembers = [SELECT Id FROM OpportunityTeamMember];
        assertEquals(0, remainingTeamMembers.size());
    }
}

=======
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
    
>>>>>>> 4fd9e0be654618225fd7536209730ac977aace3d
}