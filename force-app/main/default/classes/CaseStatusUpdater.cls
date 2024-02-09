public class CaseStatusUpdater {
    public static void updateCaseStatus(){
        
        List<Case> caseList=[SELECT Id,CaseNumber,Status FROM Case];
        
        for(Case cas:caseList){
            cas.Status='Working';
        }
        System.debug('Case Status '+caseList);
    }
}