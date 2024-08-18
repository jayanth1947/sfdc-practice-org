public class updateOppClosedDateHandler {
    public static void updateClosedDate(List<Opportunity> oldOppList){
        for(Opportunity opp:oldOppList){
            if(opp.StageName=='Closed Won'){
                Date currentDate = System.today();
                Integer daysInMonth = Date.daysInMonth(currentDate.year(), currentDate.month());
                Date newCloseDate = currentDate.addMonths(1).addDays(daysInMonth - currentDate.day());
                opp.CloseDate=newCloseDate;
                
            }
        }
        
    }
}