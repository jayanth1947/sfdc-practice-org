public class updateCaseStatusHandler {
    public static void updateCaseStatus(List<Case> caseList){
        
        for(Case cas:caseList){
            if(cas.Priority=='High'){
                cas.Status='Escalated';
            }
        }
        
    }
}