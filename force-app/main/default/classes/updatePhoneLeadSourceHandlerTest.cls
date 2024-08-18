@isTest
public class updatePhoneLeadSourceHandlerTest {
    
    @isTest
    static void updatePhone(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Test Account '+i;
            accList.add(acc);
        }
        insert accList;
        List<Contact> conList=new List<Contact>();
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        
        insert conList;
        for(Account acc:accList){
            acc.Industry='Biotechnology';
        }
        
        update accList;
        Test.stopTest();
        
        List<Contact> updConList=[SELECT Id,AccountId,LeadSource FROM Contact WHERE AccountId =:accList[0].Id];
        
        Assert.areEqual('Phone',updConList[0].LeadSource);
    }
}