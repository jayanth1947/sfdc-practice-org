@isTest
public class AccUpdatePhoneHandlerTest {
    
    @isTest
    static void updatePhone(){
        
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
            con.Phone='9867654398';
            conList.add(con);
        }
        insert conList;
        
        for(Account acc:accList){
            acc.Phone='8909324568';
        }
        
        update accList;
        
        Test.stopTest();
        List<Contact> updateconList=[SELECT Id,AccountId,Name,Phone FROM Contact WHERE AccountId=:accList[0].Id];
        
        Assert.areEqual('8909324568',updateconList[0].Phone);
        
    } 
    
    
}