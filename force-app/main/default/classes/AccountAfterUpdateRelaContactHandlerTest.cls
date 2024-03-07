@isTest
public class AccountAfterUpdateRelaContactHandlerTest {

    @isTest
    static void updateMailingAddress(){
         List<Account> accList=new List<Account>();
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.BillingStreet='Gachibowli';
            acc.BillingCity='Hyderabad';
            acc.BillingState='Telangana';
            acc.BillingCountry='India';
            acc.BillingPostalCode='516002';
            accList.add(acc);
        }
        
        insert accList;
        
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        insert conList;
        
        for(Account acc:accList){
            acc.BillingCity='Madhapur';
        }
        
        update accList;
        for(Account acc:accList){
            acc.BillingState='TN';
        }
        
        update accList;
        for(Account acc:accList){
            acc.BillingCountry='IN';
        }
        
        update accList;
        for(Account acc:accList){
            acc.BillingPostalCode='530001';
        }
        
        update accList;
        
        List<Contact> updatedConList=[SELECT Id,AccountId,MailingCity FROM Contact WHERE AccountId =:accList[0].Id];
        
        Assert.areEqual('Madhapur',updatedConList[0].MailingCity);
    }
}