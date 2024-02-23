public class AccountUndeleteHandler {
    
    public static void updateAccountName(List<Account> newAccList){
        
        List<Account> accList=new List<Account>();
        
        for(Account acc:newAccList){
            Account a=new Account();
            a.Name='Restored '+acc.Name;
            accList.add(a);
        }
        
        if(!accList.isEmpty()){
            insert accList;
        }
    }
    
}