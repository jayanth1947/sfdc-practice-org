@isTest
public class AccountBeforeInsUpdHandlerTest {
    
    @isTest
    static void insertRating(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.Industry='Media';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        List<Account> insertaccList=[SELECT Id,Name,Industry,Rating FROM Account WHERE Id =:accList[0].Id];
        
        Assert.areEqual('Hot',insertaccList[0].Rating);
    }
    
    @isTest
    static void updateRating(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.Industry='Government';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        for(Account acc:accList){
            acc.Industry='Media';
        }
        
        update accList;
        Test.stopTest();
        List<Account> insertaccList=[SELECT Id,Name,Industry,Rating FROM Account WHERE Id =:accList[0].Id];
        
        Assert.areEqual('Hot',insertaccList[0].Rating);
    }
    
}