public class AccountBeforeUpdateHandler {

    public static void updateDescription(List<Account> newAccList,Map<Id,Account> oldAccMap){
        
        for(Account acc:newAccList){
            if(acc.Phone !=oldAccMap.get(acc.Id).Phone){
                acc.Description='Old Value : '+ oldAccMap.get(acc.Id).Phone + ' New Value : '+acc.Phone;
            }
        }
    }
}