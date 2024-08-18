@isTest
public class caseUserHandlerTest {

    @isTest
    static void assignCaseUsers(){
        List<Case> caseList=new List<Case>();
        for(Integer i=1;i<=5;i++){
            Case cas=new Case();
            cas.Subject='New Cases';
            cas.Status='New';
            cas.Origin='Phone';
            caseList.add(cas);
        }
        Test.startTest();
        insert caseList;
        User userId=[SELECT Id FROM User WHERE Alias='JONTE'];
        caseUserHandler.assignCases('New', userId.Id);
        List<Case> casesToAssign = [SELECT Id, Subject,Status, OwnerId FROM Case WHERE Status='New'];
        for (Case c : casesToAssign) {
            c.OwnerId = userId.Id;
        }
        Test.stopTest();
        System.assertEquals(5,caseList.size());
        System.assertEquals(userId.Id,casesToAssign[0].OwnerId);
        
    }
}