public class updateActiveStatusOnAccount {

    public static void updateStatus(){
        List<Account> accList=[SELECT Id,Name,active_p__c,Industry,SLAExpirationDate__c FROM Account WHERE SLAExpirationDate__c >=TODAY AND Industry ='Energy'];
        
        for(Account acc:accList){
            acc.active_p__c=false;
        }
        System.debug(accList);
    }
}