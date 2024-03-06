@isTest
public with sharing class OpportunityTaskHandlerTest {
    @isTest
    static void TeseOpportunityTaskHandler() {
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 5; i++) {
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
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
        } */
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
    }
}