@isTest
public class AccountBeforeInsertHandlerTest {

    @isTest
    static void updateRating(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Kiran '+i;
            acc.Industry='Energy';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> updatedAccList=[SELECT Id,Rating FROM Account WHERE Id =:accList[0].Id];
        
        Assert.areEqual('Hot',updatedAccList[0].Rating);
    }
}