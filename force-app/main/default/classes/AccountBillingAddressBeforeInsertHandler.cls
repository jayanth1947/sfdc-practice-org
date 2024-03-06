public class AccountBillingAddressBeforeInsertHandler {

    public static void updateShippingAddress(List<Account> accList){
        for(Account acc:accList){
            if(acc.CopyBillingToShipping__c){
                acc.ShippingStreet=acc.BillingStreet;
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingState=acc.BillingState;
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
        }
    }
}