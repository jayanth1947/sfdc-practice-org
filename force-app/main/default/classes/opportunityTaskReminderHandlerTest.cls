@isTest
public class opportunityTaskReminderHandlerTest {
    
    @isTest
    static void taskReminderQualification(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opportunity';
            opp.StageName='Perception Analysis';
            opp.CloseDate=system.today();
            oppList.add(opp);
        }
        
        Test.startTest();
        insert oppList;
        
        for(Opportunity opp:oppList){
            opp.StageName='Qualification';
        }
        
        update oppList;
        Test.stopTest();
        
        List<Task> taskList=[SELECT Id,Subject FROM Task WHERE WhatId=:oppList[0].Id];
        
        Assert.isTrue(taskList!=null,'Task Records are created');
    }
    
    @isTest
    static void taskReminderProspecting(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opportunity';
            opp.StageName='Perception Analysis';
            opp.CloseDate=system.today();
            oppList.add(opp);
        }
        
        Test.startTest();
        insert oppList;
        
        for(Opportunity opp:oppList){
            opp.StageName='Prospecting';
        }
        
        update oppList;
        Test.stopTest();
        
        List<Task> taskList=[SELECT Id,Subject FROM Task WHERE WhatId=:oppList[0].Id];
        
        Assert.isTrue(taskList!=null,'Task Records are created');
    }
}