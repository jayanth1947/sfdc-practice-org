@isTest
public class UpdateNoOfTasksOnContactHandlerTest {
    
    @isTest
    static void updateTasks(){
        List<Task> taskList = new List<Task>();
        List<Contact> conList=new List<Contact>();
        Account acc=new Account(Name='Aaacount');
        insert acc;
        for(Integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.LastName='Contact '+i;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        for(Contact con:conList){
            Task tas=new Task();
            tas.Subject='Split Revenue';
            tas.Description='Please Split the Revenue among the Team Members';
            tas.Priority='High';
            tas.Status='Not Started';
            tas.WhoId=con.Id;
            taskList.add(tas);
        }
        Integer countVar=0;
        insert taskList;
        
        Test.stopTest();
        List<Contact> testContact = [SELECT Id, LastName,No_of_Tasks__c FROM Contact WHERE Id = :conList[0].Id];
        System.assertEquals(1, testContact[0].No_of_Tasks__c, 'Expected 2 tasks associated with the Contact');
        
        
    }
}