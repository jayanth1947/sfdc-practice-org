@isTest
public class duplicateAccountHandlerTest {

    @isTest
    static void checDuplicates(){
        List<Account> accList=new List<Account>();
        Account acc1=new Account(Name='Account 1');
        Account acc2=new Account(Name='Account 2');
        Account acc3=new Account(Name='Account 1');
        accList.add(acc1);
        accList.add(acc2);
        accList.add(acc3);
        
        Test.startTest();
        insert accList;
       
        
        duplicateAccountHandler.duplicateAccounts(accList);
        
        Set<String> accNames=new Set<String>();
        
        List<Account> newAccList=[SELECT Id,Name FROM Account];
        for(Account acc:newAccList){
            if(accNames.contains(acc.Name)){
                System.debug(acc.Name);
            }
            accNames.add(acc.Name);
        }
         Test.stopTest();
        
        System.assertEquals(3,accList.size());
        System.assertEquals(2,accNames.size());
    }
}