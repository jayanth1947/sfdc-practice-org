public class OpportunityBeforeInsUpdHandler {

    public static void updateDescription(List<Opportunity> oppList,Map<Id,Opportunity> oldOppMap){
        for(Opportunity opp:oppList){
            
            if(oldOppMap ==null &&  opp.StageName !=null && opp.StageName=='Closed Won'){
                opp.Description='Opportunity is Won';
            }
            else if(oldOppMap ==null  &&  opp.StageName !=null && opp.StageName=='Closed Lost'){
                opp.Description='Opportunity is lost';
            }
            
            else if(opp.StageName !=null && opp.StageName=='Closed Won' && opp.StageName != oldOppMap.get(opp.Id).StageName){
                 opp.Description='Opportunity is Won';
            }
            else if(opp.StageName !=null && opp.StageName=='Closed Lost' && opp.StageName != oldOppMap.get(opp.Id).StageName){
                 opp.Description='Opportunity is Lost';
            }
            else{
                opp.Description='Opportunity is Open';
            }
        }
    }
}