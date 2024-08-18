public class OpportunityCalculator {
	
    public static void calculateTotalValue(){
        
        Decimal totalAmount=0;
        List<Opportunity> oppList= [SELECT Id,Amount FROM Opportunity WHERE Amount!=null];
        for(Opportunity opp:oppList){
            totalAmount+=opp.Amount;
        }
        System.debug('Total Opportunity Value '+totalAmount);
    }
}