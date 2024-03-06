@isTest
public class AccountAfterInsertCreateOppHandlerTest {

    @isTest
    static void createOpportunity(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Opportunity> oppList=[SELECT Id,Name FROM Opportunity WHERE Id=:accList[0].Id];
        
        Assert.isTrue(oppList!=null,'Opportunity records created');
    }
    
}