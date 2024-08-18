@isTest
public class AccountBeforeUpdateHandlerTest {
    
    @isTest
    static void updateDescription(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.Phone='8909876546';
            accList.add(acc);
        }
        Test.startTest();
        
        insert accList;
        
        for(Account acc:accList){
            acc.Phone='9602402221';
        }
        
        update accList;
        Test.stopTest();
        
        List<Account> updateAccList=[SELECT Id,Phone FROM Account WHERE Id =:accList[0].Id];
        
        Assert.areEqual('9602402221',updateAccList[0].Phone);
    }
}