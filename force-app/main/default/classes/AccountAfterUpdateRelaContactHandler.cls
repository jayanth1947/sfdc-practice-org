public class AccountAfterUpdateRelaContactHandler {
    
    public static void updateMailingAddress(List<Account> accList,Map<Id,Account> oldAccMap){
        
        Set<Id> accIds=new Set<Id>();
        for(Account acc:accList){
            accIds.add(acc.Id);
        }
        
        List<Contact> conList= [SELECT Id, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry,AccountId 
                                FROM Contact WHERE AccountId =:accIds];
        
        for(Account acc:accList){
            if((acc.BillingStreet!=null && acc.BillingStreet!=oldAccMap.get(acc.Id).BillingStreet) ||
               (acc.BillingCity!=null && acc.BillingCity!=oldAccMap.get(acc.Id).BillingCity) || 
               (acc.BillingState!=null && acc.BillingState!=oldAccMap.get(acc.Id).BillingState) ||
               (acc.BillingCountry!=null && acc.BillingCountry!=oldAccMap.get(acc.Id).BillingCountry) ||
               (acc.BillingPostalCode!=null && acc.BillingPostalCode!=oldAccMap.get(acc.Id).BillingPostalCode) ){
                   for(Contact con:conList){
                       con.MailingStreet=acc.BillingStreet;
                       con.MailingCity=acc.BillingCity;
                       con.MailingState=acc.BillingState;
                       con.MailingCountry=acc.BillingCountry;
                       con.MailingPostalCode=acc.BillingPostalCode;
                   }
               }
        }
        
        if(!conList.isEmpty()){
            update conList;
        }
    }
}