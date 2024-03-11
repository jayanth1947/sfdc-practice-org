@isTest
public class AccountBeforeDeleteHandlerTest {

    @isTest
    static void preventDeletion(){
        List<Account> accList=new List<Account>();
        
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Hari '+i;
            acc.Active__c='Yes';
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Boolean exceptionThrown =false;
        try{
         delete accList;   
        }
        catch(Exception e){
             exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains(Label.Prevent_Account_Deletion)) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
    }
}