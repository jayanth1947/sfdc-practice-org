public class calculateOppAmount {
    public static Decimal totalOppAmount(List<Opportunity> oppList){
        
        Decimal sum=0;
        for(Opportunity opp:oppList){
            sum+=opp.Amount;  
        }
        
        System.debug('Sum of Amount '+sum);
        return sum;
    }
}