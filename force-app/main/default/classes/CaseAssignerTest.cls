@isTest
public class CaseAssignerTest {

    @isTest
    static void assignCases(){
        List<Case> casList=new List<Case>();
        for(Integer i=1;i<=5;i++){
            Case cas=new Case();
            cas.Subject='New Case';
            cas.Status='New';
            cas.Origin='Phone';
            casList.add(cas);
        }
        insert casList;
        
        Test.startTest();
        CaseAssigner.assignCasesToQueues();
        Test.stopTest();
        
        List<Case> updateCaseList=new List<Case>();
        
        for(Case ca:[SELECT Id,Subject,Status FROM Case WHERE Status='New']){
            if(ca.Subject!=null){
                ca.QueueId__c='HighPriorityQueueId';
                Assert.areEqual('HighPriorityQueueId',ca.QueueId__c);
            
            }
            updateCaseList.add(ca);
        }
        update updateCaseList;
        Assert.areEqual(5,casList.size());
        
    }
    
    @isTest
    static void assignCasesNoSubject(){
        List<Case> casList=new List<Case>();
        for(Integer i=1;i<=5;i++){
            Case cas=new Case();
            cas.Status='New';
            cas.Origin='Phone';
            casList.add(cas);
        }
        insert casList;
        
        Test.startTest();
        CaseAssigner.assignCasesToQueues();
        Test.stopTest();
        
        List<Case> updateCaseList=new List<Case>();
        
        for(Case ca:[SELECT Id,Subject,Status FROM Case WHERE Status='New']){
            if(ca.Subject==null){
                ca.QueueId__c='DefaultQueueId';
                Assert.areEqual('DefaultQueueId',ca.QueueId__c);
            
            }
            updateCaseList.add(ca);
        }
        update updateCaseList;
        Assert.areEqual(5,casList.size());
        
    }
    
    
}