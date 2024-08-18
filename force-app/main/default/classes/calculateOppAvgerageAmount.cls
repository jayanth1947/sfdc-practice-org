public class calculateOppAvgerageAmount {

    public static void calculateAvgAmount(List<Opportunity> oppList){
        
        Decimal sum=0;
        Decimal avg=0;
        Integer listSize=oppList.size();
        for(Opportunity opp:oppList){
            if(opp.Amount!=null){
                sum =sum+opp.Amount;
            }
        }
         System.debug('Sum Of Opp Amounts '+sum);
        avg=sum/listSize;
        System.debug('Avg Amount '+avg);
    }
}