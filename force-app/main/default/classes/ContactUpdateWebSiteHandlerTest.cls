@isTest
public class ContactUpdateWebSiteHandlerTest {
    
    @isTest
    static void updateWebsite(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.Phone='9021212221';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        List<Contact> conList=new List<Contact>();
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            con.Website__c='www.facebook.com';
            conList.add(con);
        }
        
        insert conList;
        
        for(Account acc:accList){
            acc.Website='www.google.com';
        }
        
        update accList;
        
        Test.stopTest();
        List<Contact> updatedconList=[SELECT Id,AccountId,Name,Website__c FROM Contact WHERE AccountId =:accList[0].Id];
        
        Assert.areEqual('www.google.com',updatedconList[0].Website__c);
    }
}