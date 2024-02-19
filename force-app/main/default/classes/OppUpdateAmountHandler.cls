public class OppUpdateAmountHandler {

    public static void updateOppAmount(List<Opportunity> newOpplist, Map<Id,Opportunity> oldOppList){
        
        for(Opportunity opp:newOppList){
            if(oldOppList.get(opp.Id).StageName !=opp.StageName){
                System.debug('StageName is Changed');
                opp.Amount=opp.Probability * opp.ExpectedRevenue;
            }
        }
    }
}