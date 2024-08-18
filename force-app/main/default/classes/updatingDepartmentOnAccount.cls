public class updatingDepartmentOnAccount {

    public static void updateDepartment(List<Account> accList){
        
        for(Account acc:accList){
            if(acc.Industry=='Finance' || acc.Industry=='Construction'){
                acc.Department__c='Finance';
            }
            else if(acc.Industry=='Education'){
                acc.Department__c='IT';
            }
            else if(acc.Industry=='Technology'){
                acc.Department__c='IT';
            }
            else if(acc.Industry=='Government'){
                acc.Department__c='HR';
            }
        }
        System.debug(accList);
    }
}