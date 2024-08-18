public with sharing class oppController {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        return [SELECT StageName FROM Opportunity];
    }
}