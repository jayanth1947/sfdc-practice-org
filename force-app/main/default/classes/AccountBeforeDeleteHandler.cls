public class AccountBeforeDeleteHandler {

    public static void preventDeletion(List<Account> accList){
        for(Account acc:accList){
            if(acc.Active__c=='Yes'){
                acc.addError(Label.Prevent_Account_Deletion);
            }
        }
    }
}