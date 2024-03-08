@isTest
public class AccountOwnerShipPreventionHandlerTest {
    
    @isTest
    static void preventChangeOwner(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.Industry='Agriculture';
            acc.Type='Prospect';
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        
        for(Account acc:accList){
            acc.Ownership='Private';
        }
        
        Boolean exceptionThrown =false;
        try{
            update accList;
        }
        catch(Exception e){
            exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('OwnerShip Cannot be Modified')) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
    }
    
}