@isTest
public class OpportunityBeforeInsUpdHandlerTest {

    @isTest
    static void insertOpportunity(){
        List<Opportunity> oppList=new List<Opportunity>();
        Opportunity opp1=new Opportunity(Name='Opp1',CloseDate=system.today()+3,StageName='Prospecting');
        Opportunity opp2=new Opportunity(Name='Opp2',CloseDate=system.today()+3,StageName='Closed Won');
       	Opportunity opp3=new Opportunity(Name='Opp3',CloseDate=system.today()+3,StageName='Closed Lost');
        oppList.add(opp1);
        oppList.add(opp2);
       	oppList.add(opp3);
        
        Test.startTest();
        insert oppList;
        
        List<Opportunity> updateOppList=[SELECT Id,Name,Description FROM Opportunity WHERE Id =:oppList[0].Id];
        Test.stopTest();
        
        Assert.areEqual('Opportunity is Open',updateOppList[0].Description);
    }
    
    @isTest
    static void updateOpportunity(){
        List<Opportunity> oppList=new List<Opportunity>();
        Opportunity opp1=new Opportunity(Name='Opp1',CloseDate=system.today()+3,StageName='Prospecting');
        Opportunity opp2=new Opportunity(Name='Opp2',CloseDate=system.today()+3,StageName='Qualification');
       	Opportunity opp3=new Opportunity(Name='Opp3',CloseDate=system.today()+3,StageName='Need Analysis');
        oppList.add(opp1);
        oppList.add(opp2);
       	oppList.add(opp3);
        
        Test.startTest();
        insert oppList;
        
        for(Opportunity opp:oppList){
            opp.StageName='Closed Won';
        }
        
        update oppList;
        
        List<Opportunity> updateOppList=[SELECT Id,Name,Description FROM Opportunity WHERE Id =:oppList[0].Id];
        
        Assert.areEqual('Opportunity is Won',updateOppList[0].Description);
         for(Opportunity opp:oppList){
            opp.StageName='Closed Lost';
        }
        update oppList;
        Test.stopTest();
        
		List<Opportunity> newupdateOppList=[SELECT Id,Name,Description FROM Opportunity WHERE Id =:oppList[0].Id];
        
        Assert.areEqual('Opportunity is Lost',newupdateOppList[0].Description);
    }
}