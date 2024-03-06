@isTest
public class AccountBillingAddressBeforeInserTest {

    @isTest
    static void updateShippingAddressInsert(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.BillingStreet='Kondapur';
            acc.BillingCity='Hyderabad';
            acc.BillingState='Telangana';
            acc.BillingCountry='India';
            acc.BillingPostalCode='561001';
            acc.CopyBillingToShipping__c=true;
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Account> updatedAccList=[SELECT Id,Name,ShippingStreet,ShippingCity,ShippingState,ShippingCountry,ShippingPostalCode 
                                     FROM Account WHERE Id =:accList[0].Id];
         System.debug(updatedAccList[0].ShippingStreet);
        Assert.areEqual('Kondapur',updatedAccList[0].ShippingStreet);
    }
    
    
    @isTest
    static void updateShippingAddressUpdate(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            acc.BillingStreet='Kondapur';
            acc.BillingCity='Hyderabad';
            acc.BillingState='Telangana';
            acc.BillingCountry='India';
            acc.BillingPostalCode='561001';
            accList.add(acc);
        }
        
        Test.startTest();
        //Inserting list
        insert accList;
        System.debug(accList[0]);
        //Updating List
        for(Account acc:accList){
            acc.CopyBillingToShipping__c=true;
        }
        
        update accList;
        System.debug(accList[0].BillingStreet);
        Test.stopTest();
        
        List<Account> updatedAccList=[SELECT Id,Name,ShippingStreet,ShippingCity,ShippingState,ShippingCountry,ShippingPostalCode 
                                     FROM Account WHERE Id =:accList[0].Id];
        System.debug(updatedAccList);
        System.debug(updatedAccList[0].ShippingStreet);
        Assert.areEqual('Kondapur',updatedAccList[0].ShippingStreet);
    }
}