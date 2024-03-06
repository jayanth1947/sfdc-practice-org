@isTest
public class AccountAfterInsertHandlerTest {

    @isTest
    static void createContact(){
         List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Contact> conList=[SELECT Id,LastName,AccountId FROM Contact WHERE Id =:accList[0].Id];
        
        Assert.isTrue(conList!=null,'Contacts are created');
    }
}