public class AccountBeforeUpdatePreventHandler {

    public static void preventEditOfAccount(List<Account> accList){
        
        for(Account acc:accList){
            if(acc.CreatedDate < System.today() - 7){
                acc.addError('You dont have the rights to edit this record');
            }
        }
    }
}