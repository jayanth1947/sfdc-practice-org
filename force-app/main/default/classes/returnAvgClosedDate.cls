public class returnAvgClosedDate {
    
    public static Date returnAvgDate(){
        
        List<Opportunity> oppList=[SELECT Id,Name,CloseDate FROM Opportunity];
        Long sum=0;
        
        for(Opportunity opp:oppList){
            Date cd=opp.CloseDate;
            Datetime dt = Datetime.newInstance(cd, Time.newInstance(0, 0, 0, 0));
            sum +=dt.getTime();
        }
        Long average = sum / oppList.size();
        // Convert the average close date from milliseconds to a date object
        Datetime averageDate = Datetime.newInstance(average);
        //Time myTime = Time.newInstance(averageDate.hour(), averageDate.minute(), averageDate.second(), averageDate.millisecond());
        Date d = Date.newInstance(averageDate.year(), averageDate.month(), averageDate.day());
        System.debug('Avg date '+d);
        //System.debug('Avg Time '+myTime);
        // Return the average date as  the result
        return d;
    }
}