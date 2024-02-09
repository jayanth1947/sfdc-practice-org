public class AccountCounter {
    
    public static Integer countAccounts(){
        
        List<Account> accList=[SELECT Id,Name FROM Account];
        Integer ar1= [SELECT COUNT() FROM Account];
        
        System.debug('Count of Accounts '+ar1);
        
        Integer count=0;
        
        for(Account acc:accList){
            count++;
        }
        System.debug('Total No of Accounts '+count);
        return count;
    }
}