public class showOppRecords {
    public static void retriveOppRecords(String accId){
        
        List<Opportunity> oppList=[select  Name, StageName,CloseDate,Amount, Accountid FROM Opportunity WHERE AccountId=:accId];
        
        for(Opportunity opp:oppList){            
            System.debug('Opp Name '+opp.Name+ ' Opp Stage Name '+opp.StageName);
        }
    }
}