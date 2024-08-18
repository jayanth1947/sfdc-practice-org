@isTest
public class CreateContactHandlerTest {

    @isTest
    static void createContactsTest(){
        List<Account> accList =new List<Account>();
        for(Integer i=0;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account Test '+i;
            acc.Create_N_Contacts__c=3;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        
        Test.stopTest();
        
        
        List<Contact> conList=[SELECT Id FROM Contact WHERE AccountId =: accList[0].Id];
        
        System.assert(conList!=null,'Contact list dont have records');
    }
}