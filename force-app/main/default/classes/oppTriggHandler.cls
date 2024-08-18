public class oppTriggHandler {
    public static void updateStage(List<Opportunity> oppList){
        List<Opportunity> newOppList = new List<Opportunity>();
        for(Opportunity opp:oppList){
            if(opp.Amount>=10000){
                opp.StageName='Closed Won';
            }
        }
        if(!newOppList.isEmpty()){
            update newOppList;
        }
    }
}