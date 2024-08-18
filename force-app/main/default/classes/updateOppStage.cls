public class updateOppStage {

    public static void updateStage(List<Opportunity> oppList){
        
        for(Opportunity opp:oppList){
            if(opp.CloseDate<System.today()){
                opp.StageName='Closed Lost';
            }
        }
    }
}