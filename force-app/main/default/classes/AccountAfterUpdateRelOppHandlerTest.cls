@isTest
public class AccountAfterUpdateRelOppHandlerTest {

    @isTest
    static void updateStageName(){
        List<Account> accList=new List<Account>();
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Hari '+i;
            acc.Active__c='Yes';
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
        
        insert oppList;
        
        for(Account acc:accList){
            acc.Active__c='No';
        }
        
        update accList;
        
        List<Opportunity> updatedOppList=[SELECT Id,Name,AccountId,StageName FROM Opportunity WHERE AccountId =:accList[0].Id];
        
        Assert.areEqual('Closed Lost',updatedOppList[0].StageName);
    }
}