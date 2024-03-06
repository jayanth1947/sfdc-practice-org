public class AccountBillingAddressBeforeInsertHandler {

    public static void updateShippingAddress(List<Account> accList,Map<Id,Account> oldAccMap){
        for(Account acc:accList){
            if( (oldAccMap ==null && acc.CopyBillingToShipping__c)
                ||( acc.CopyBillingToShipping__c && acc.CopyBillingToShipping__c != oldAccMap.get(acc.Id).CopyBillingToShipping__c)){
                acc.ShippingStreet=acc.BillingStreet;
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingState=acc.BillingState;
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
        }
    }
}