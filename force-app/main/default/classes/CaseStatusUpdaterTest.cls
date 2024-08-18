@isTest
public class CaseStatusUpdaterTest {

    @isTest
    static void updateStatus(){
        List<Case> caseList=new List<Case>();
        for(Integer i=1;i<=50;i++){
            Case cas=new Case();
            cas.Subject='New Case';
            cas.Status='New';
            cas.Origin='Web';
            caseList.add(cas);
        }
        Test.startTest();
        insert caseList;
        CaseStatusUpdater.updateCaseStatus();
        
        for(Case cas:caseList){
            if(cas.Status!=null){
                cas.Status='Working';
                System.assertEquals('Working',cas.Status);
            }
        }
        Test.stopTest();
        
        System.assertEquals(50,caseList.size());
    }
}