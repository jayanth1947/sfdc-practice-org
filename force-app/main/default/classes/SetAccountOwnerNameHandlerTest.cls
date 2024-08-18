@isTest
public class SetAccountOwnerNameHandlerTest {
    
    @isTest
    static void setOwnerAccount(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> updatedAccList=[SELECT Id,Sales_Rep__c FROM Account WHERE Id =:accList[0].Id];
        
        Assert.areEqual('JAYANTH ONTERU',updatedAccList[0].Sales_Rep__c);
    }
}