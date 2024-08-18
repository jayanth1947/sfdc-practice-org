@isTest
public class AccountUndeleteHandlerTest {
    
    @isTest
    static void undeleteAccount(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            accList.add(acc);
        }
        insert accList;
        
        delete accList;
        
        Test.startTest();
        undelete accList;
        Test.stopTest();
        
        List<Account> updaAccList=[SELECT Id,Name FROM Account WHERE Id=:accList[0].Id];
        
        Assert.areEqual(1,updaAccList.size());
    }
}