public class duplicateAccountHandler {

    public static Boolean duplicateAccounts(List<Account> accList){
        
        Set<String> accNames=new Set<String>();
        
        for(Account acc:accList){
            if(accNames.contains(acc.Name)){
                System.debug(acc.Name);
                return true;
            }
            accNames.add(acc.Name);
            System.debug(accNames);
        }
        
        return false;
    }
}