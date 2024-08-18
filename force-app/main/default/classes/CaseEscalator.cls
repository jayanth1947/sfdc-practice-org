public class CaseEscalator {
    public static void updateCaseStatus(List<Case> caseList){
        
        List<Case> newCaseList =[SELECT Id,CaseNumber,Status FROM Case];
        
        for(Case cas:newCaseList){
            cas.Status='Escalated';
            System.debug(cas.Status);
        }
        
    }
}