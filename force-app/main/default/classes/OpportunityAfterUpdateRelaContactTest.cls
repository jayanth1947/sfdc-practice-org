@isTest
public class OpportunityAfterUpdateRelaContactTest {

    @isTest
    static void createTask(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.CloseDate=system.today()+7;
            opp.Amount=300000;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        Test.stopTest();
        
        for(Opportunity opp:oppList){
            opp.StageName='Closed Won';
        }
        update oppList;
        
        List<Task> updatedTaskList=[SELECT Id,OwnerId,Subject FROM Task];
        
        Assert.areEqual('New Task for Opportunity',updatedTaskList[0].Subject);
    }
}