public class updateMailingAddressFromAccountHandler {
    
    public static void updateMailingAddress(List<Contact> newConList){
        
        List<Id> accountIds=new List<Id>();
        Map<Id,Id> conAccountMap=new Map<Id,Id>();
        for(Contact con:newConList){
            accountIds.add(con.AccountId);
            conAccountMap.put(con.Id,con.AccountId);
        }

        
        Map<Id,Account> accountMap=new Map<Id,Account>([SELECT Id, Name, BillingStreet, BillingCity, 
                                                        BillingState, BillingPostalCode, BillingCountry FROM Account WHERE Id IN: accountIds]);
        
        if(!accountMap.isEmpty()){
            for(Contact con:newConList){
                con.MailingStreet=accountMap.get(con.AccountId).BillingStreet;
                con.MailingCity=accountMap.get(con.AccountId).BillingCity;
                con.MailingState=accountMap.get(con.AccountId).BillingState;  
                con.MailingPostalCode=accountMap.get(con.AccountId).BillingPostalCode;
                con.MailingCountry=accountMap.get(con.AccountId).BillingCountry;
            }  
        } 
    }
}