public class checkAmountFrequencyOpportunity {
	
    public static Boolean checkAmount(List<Opportunity> oppList){
        
        for(Opportunity opp:oppList){
            if(opp.Amount>=10000){
                System.debug(opp.Name);
                return true;
            }
            
        }
        return false;
    }
}