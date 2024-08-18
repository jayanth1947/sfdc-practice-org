public class OppNextStepHandler {
    public static void updateNextStep(List<Opportunity> oppList){
        
        for(Opportunity opp:oppList){
            if(opp.StageName!=null && opp.StageName=='Closed Lost'){
                opp.NextStep='Follow-up';
            }
        }
    }
}