public class SetAccountOwnerNameHandler {

    public static void updateOwnerOnAccount(List<Account> newAccList){
        
        Map<Id,Id> accOwnerIdsMap=new Map<Id,Id>();
        
        for(Account acc:newAccList){
            accOwnerIdsMap.put(acc.Id,acc.OwnerId);
        }
        
        //Retriving the user records as per the owner ids
        Map<Id,User> userMap=new Map<Id,User>([SELECT Id,Name FROM User WHERE Id IN:accOwnerIdsMap.values()]);
        
        for(Account acc:newAccList){
            //Getting the owner name from the account id
            acc.Sales_Rep__c=userMap.get(accOwnerIdsMap.get(acc.Id)).Name;
            
        }
    }
}