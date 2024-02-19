public class AccUpdatePhoneHandler {
    
    public static void updatePhonerecords(List<Account> accList,Map<Id,Account> oldMap){
        
        //Account Ids
        Set<Id> accIds=new Set<Id>();
        for(Account acc:accList){
            accIds.add(acc.Id);
        }
        
        List<Contact> conList=[SELECT Id,Name,Phone FROM Contact WHERE AccountId=:accIds];
        
        for(Account acc:accList){
            if(oldMap.get(acc.Id).Phone !=acc.Phone){
                for(Contact con:conList){
                    con.Phone=acc.Phone;
                }
            }
        }
        update conList;
        
    }
}