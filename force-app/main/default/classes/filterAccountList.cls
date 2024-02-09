public class filterAccountList {
    
    public static List<Account> fileterAccounts(String industry){
        List<Account> accList=[SELECT Id,Name,Industry FROM Account WHERE Industry=:industry];
        System.debug(accList);
        return accList;
        
        
    }
}