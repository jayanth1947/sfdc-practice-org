public class AccountAfterUpdateRelOppHandler {

    public static void updateOppStage(List<Account> accList,Map<Id,Account> oldAccMap){
        
        Set<Id> accIds=new Set<Id>();
        for(Account acc:accList){
            if(acc.Active__c=='No' && acc.Active__c!=oldAccMap.get(acc.Id).Active__c){
                accIds.add(acc.Id);
            }
        }
        
        List<Opportunity> oppList=[SELECT Id,AccountId,Name,StageName FROM Opportunity WHERE AccountId =:accIds];
        
        for(Opportunity opp:oppList){
            if(opp.StageName!=null && opp.StageName!='Closed Won'){
                opp.StageName='Closed Lost';
            }
        }
        update oppList;
    }
}