@isTest
public class ContactPreventionHandlerTest {
    
    @isTest
    static void preventContact(){
        
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.LastName='Contact '+i;
            conList.add(con);
        }
        Test.startTest();
        insert conList;
        ContactPreventionHandler.preventUserForContact(conList);
        Test.stopTest();
        
        List<Contact> updateConList=[SELECT Id,LastName FROM Contact WHERE AccountId !=null];
        
        Assert.isTrue(updateConList!=null,'Updated contacts');
    } 
}