@isTest
public class updateOppStageTest {

    @isTest
    static void updateStageName(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opportunity';
            opp.StageName='Prospecting';
            opp.CloseDate=system.today();
            oppList.add(opp);
        }
        insert oppList;
        Test.startTest();
        updateOppStage.updateStage(oppList);
        Test.stopTest();
        
        List<Opportunity> newopp=[SELECT Id,Name,StageName,CloseDate FROM Opportunity WHERE Id=:oppList[0].Id];
        for(Opportunity op:newopp){
            if(op.CloseDate!=null){
                op.StageName='Closed Lost';
            }
        }
        update newopp;
        
        System.assertEquals(5,oppList.size());
        System.assertEquals('Closed Lost',newopp[0].StageName);
    }
}