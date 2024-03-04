@isTest
public class AccountCounterTest {

    @isTest
    static void accCounter(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1;i<=50;i++){
            Account acc=new Account();
            acc.Name='New Account '+i;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        AccountCounter.countAccounts();
        
        Integer count=0;
        for(Account acc:accList){
            count++;
        }
        Test.stopTest();
        
        System.assertEquals(50,count);
    }
}