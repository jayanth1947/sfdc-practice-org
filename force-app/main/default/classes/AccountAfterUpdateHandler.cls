public class AccountAfterUpdateHandler {

    public static void updateRelContactPhone(List<Account> accList,Map<Id,Account> oldAccMap){

		Set<Id> accIds=new Set<Id>();        
        for(Account acc:accList){
            accIds.add(acc.Id);
        }
        
        List<Contact> conList=[SELECT Id,Phone,AccountId FROM Contact WHERE AccountId =:accIds];
        for(Account acc:accList){
            if(acc.Phone!=null && acc.Phone!=oldAccMap.get(acc.Id).Phone){
                for(Contact con:conList){
                    con.Phone=acc.Phone;
                }
            }
        }
        
        if(!conList.isEmpty()){
            update conList;
        }
        
    }
}