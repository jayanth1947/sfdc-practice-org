@isTest
public class DuplicateContactHandlerTest {
    
    @isTest
    static void checkDuplicates(){
        List<Contact> conList=new List<Contact>();
        Account acc=new Account(Name='Account');
        insert acc;
        for(Integer i=1;i<=3;i++){
            Contact con =new Contact();
            con.LastName='Contact '+i;
            con.Email='kiran@gmail.com';
            con.Phone='8989233331';
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        
        Contact con=new Contact(LastName='Contact 1',Email ='kiran@gmail.com',Phone='8989233331' ,AccountId=acc.Id);
        
        Boolean exceptionThrown =false;
        try{
            insert con;
        }
        catch(Exception e){
            exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('Duplicates Found')) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
    }
    
}