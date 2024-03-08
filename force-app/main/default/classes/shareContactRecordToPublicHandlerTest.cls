@isTest
public class shareContactRecordToPublicHandlerTest {
    
    @isTest
    static void shareContact(){
        List<Contact> conList=new List<Contact>();
        Account acc=new Account(Name='Kiran');
        insert acc;
        for(Integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.LastName='Kimm '+i;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        Test.stopTest();
        
        List<ContactShare> conshareList=[SELECT Id,ContactId FROM ContactShare WHERE ContactId=:conList[0].Id];
        
        Assert.isTrue(conshareList!=null,'Contact Share records are created');
        
    }
}