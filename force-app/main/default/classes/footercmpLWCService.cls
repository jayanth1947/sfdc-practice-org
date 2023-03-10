public with sharing class footercmpLWCService {
    @AuraEnabled(cacheable=true)
    public static List<Footer__c> getfooterContent(){
        List<Footer__c> footerContent = new List<Footer__c>();
        try {
            footerContent=[select Id,Content__c,Name from Footer__c WITH SECURITY_ENFORCED LIMIT 3];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return footerContent;
    }
}