@isTest
public class LeadTaskHandlerTest {
    
    @isTest
    public static void testinsert() {
        List<Lead> leadList=new List<Lead>();
        
        for(Integer i=1;i<=5;i++){
            Lead lea=new Lead();
            lea.LastName='CEO '+i;
            lea.Company='Google';
            lea.Status='New';
            leadList.add(lea);
        }
        
        Test.startTest();
        insert leadList;
        LeadTaskHandler.createTaskRec(leadList);
        List<Task> taskList=new List<Task>();
        for(Lead lea:leadList){
            Task tas=new Task();
            tas.Subject='Split Revenue';
            tas.Description='Please Split the Revenue among the Team Members';
            tas.Priority='High';
            tas.Status='Not Started';
            tas.WhoId=lea.Id;
            taskList.add(tas);
        }
        
        insert taskList;
         Test.stopTest();
        List<Task> updatedTaskList=[SELECT Id,Subject,WhoId FROM Task WHERE WhoId=:leadList[0].Id];
        
        Assert.areEqual('Split Revenue',updatedTaskList[0].Subject);
 
    }
}