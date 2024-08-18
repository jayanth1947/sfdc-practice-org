@isTest
public class OppDeleteAndCreateTaskHandlerTest {
    
    @isTest
    static void createTask(){
        
        Account acc=new Account(Name='Account');
        insert acc;
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opportunity '+i;
            opp.StageName='Prospecting';
            opp.CloseDate=system.today() +8;
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }
        insert oppList;
        
        delete oppList;
        
        List<Task> createdTasks = [SELECT Id FROM Task WHERE WhatId = :acc.Id];
        System.assert(createdTasks.size()!=null, 'Expected one Task to be created');
        
        
    }
}