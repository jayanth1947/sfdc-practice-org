public class OpportunityBeforeUpdateHandler {

    public static void populateClosedReason(List<Opportunity> oppList, Map<Id,Opportunity> oldOppMap){
        
        for(Opportunity opp:oppList){
            if((opp.StageName != oldOppMap.get(opp.Id).StageName) && opp.StageName =='Closed Lost'){
                if(opp.Close_Reason__c==null){
                    opp.addError('Please Populate Closed Reason');
                }
            }
        }
    }
}