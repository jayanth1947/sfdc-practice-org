@isTest
public class caseAfterInsertHandlerTest {
    
    @isTest
    static void populateLatestCaseNumber(){
        List<Account> accList=new List<Account>();
        List<Case> casList=new List<Case>();
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Hari '+i;
            accList.add(acc);
        }
        
        insert accList;
        
        for(Account acc:accList){
            Case cas=new Case();
            cas.Subject='New Case';
            cas.Origin='Phone';
            cas.Status='New';
            cas.AccountId=acc.Id;
            casList.add(cas);
        }
        
        Test.startTest();
        insert casList;
        Test.stopTest();
        
        List<Account> updatedList=[SELECT Id,Latest_Case_Number__c FROM Account WHERE Id =:accList[0].Id];
        List<Case> updateCaseList=[SELECT Id,CaseNumber FROM Case WHERE Id =:casList[0].Id];
        
        Assert.areEqual(updatedList[0].Latest_Case_Number__c,updateCaseList[0].CaseNumber);
    }
}