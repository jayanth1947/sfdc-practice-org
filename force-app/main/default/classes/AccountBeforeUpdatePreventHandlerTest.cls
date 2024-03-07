@isTest
public class AccountBeforeUpdatePreventHandlerTest {

    @isTest
    static void preventUserToEdit(){
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
            for(Account acc:accList){
                acc.Active__c='No';
            }
            update accList;
        }
        catch(Exception e){
             exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('You dont have the rights to edit this record')) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
    }
}