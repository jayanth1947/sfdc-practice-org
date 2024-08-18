@isTest
public class addOpportunityTeamMembersHandlerTest {
    
    @isTest
    static void createTeamMem(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opportunity';
            opp.StageName='Prospecting';
            opp.CloseDate=system.today();
            oppList.add(opp);
        }
        
        Test.startTest();
        insert oppList;
        
        for(Opportunity opp:oppList){
            opp.StageName='Needs Analysis';
        }
        
        update oppList;
        Test.stopTest();
        
        List<OpportunityTeamMember> oppTeamList=[SELECT Id FROM OpportunityTeamMember WHERE OpportunityId=: oppList[0].Id];
        
        Assert.isTrue(oppTeamList!=null,'Opportunity Team Memeber Records are Created');
    }
}