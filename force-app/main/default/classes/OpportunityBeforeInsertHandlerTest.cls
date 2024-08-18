@isTest
public class OpportunityBeforeInsertHandlerTest {

    @isTest
    static void updateDescription(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.CloseDate=system.today()+7;
            opp.Amount=300000;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Opportunity> updateOppList=[SELECT Id,Name,Description FROM Opportunity WHERE Id =:oppList[0].Id];
        
        Assert.areEqual('Hot Opportunity',updateOppList[0].Description);
    }
}