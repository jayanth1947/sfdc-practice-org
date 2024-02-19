//As soon as a Lead record is created, create a task for the Lead Owner to follow up with the customer.
public class LeadTaskHandler {

    public static void createTaskRec(List<Lead> leadList){
        
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
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}