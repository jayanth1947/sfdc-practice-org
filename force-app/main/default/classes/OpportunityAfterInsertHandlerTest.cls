@isTest
public class OpportunityAfterInsertHandlerTest {

    @isTest
    static void populateLatestAmount(){
        List<Account> accList=new List<Account>();
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Hari '+i;
            accList.add(acc);
        }
        
        insert accList;
        
        for(Account acc:accList){
            Opportunity opp=new Opportunity();
            opp.Name=acc.Name;
            opp.AccountId=acc.Id;
            opp.Amount=20000;
            opp.StageName='Prospecting';
            opp.CloseDate=system.today()+4;
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        List<Account> updateAccList=[SELECT Id,Name,Latest_Opportunity_Amount__c FROM Account WHERE Id =:accList[0].Id];
        List<Opportunity> updateOppList=[SELECT Id,Amount FROM Opportunity WHERE Id =:oppList[0].Id];
        
        Assert.areEqual(updateAccList[0].Latest_Opportunity_Amount__c,updateOppList[0].Amount);
    }
}