@isTest
public class preventTaskUpdateHandlerTest {
    
    @isTest
    static void preventTasks(){
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
        insert taskList;
        for(Task tas:taskList){
            tas.Subject='New Subject';
        }
        
        
        Boolean exceptionThrown =false;
        try{
            update taskList;
        }
        catch(Exception e){
            exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('You can not update this task')) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
        
    }
}