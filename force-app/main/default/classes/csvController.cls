public with sharing class csvController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id,Name,Phone,AnnualRevenue,Industry FROM Account];
    }
}