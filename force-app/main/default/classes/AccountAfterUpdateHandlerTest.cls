@isTest
public class AccountAfterUpdateHandlerTest {

    @isTest
    static void updateRelatedPhone(){
        List<Account> accList=new List<Account>();
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.Phone='9823475829';
            accList.add(acc);
        }
        
        insert accList;
        
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            con.Phone='9898987876';
            conList.add(con);
        }
        insert conList;
        
        for(Account acc:accList){
            acc.Phone='9867675614';
        }
        
        update accList;
        
        List<Contact> updatedConList=[SELECT Id,Phone,AccountId FROM Contact WHERE AccountId=:accList[0].Id];
        
        Assert.areEqual('9867675614',updatedConList[0].Phone);
    }
}