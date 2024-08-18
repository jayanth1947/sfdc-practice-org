@isTest
public class AccountDuplicatorTest {

    @isTest
    static void checkAccDuplicator(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            accList.add(acc);
        }
        insert accList;
        Test.startTest();
        AccountDuplicator.duplicateAccount(accList[0].Id);
        Test.stopTest();
        Account acc1=new Account(Name='Account 1');
        insert acc1;
        if(accList[0].Id==acc1.Id){
            System.debug('Duplicate found');
        }
        else{
            System.debug('Not Found');
        }
    }
}