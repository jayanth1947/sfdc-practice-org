@isTest
public class NotifyOppUsersEmailHandlerTest {
    
    @isTest
    static void sendMailToOppTeamMembers(){
        
        Account acc=new Account(Name='Jimmy');
        insert acc;
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='Opp '+i;
            opp.CloseDate=system.today()+5;
            opp.StageName='Prospecting';
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }
        
        Test.startTest();
        insert oppList;
        
        OpportunityTeamMember oppTeam=new OpportunityTeamMember(OpportunityId = oppList[0].Id, UserId = UserInfo.getUserId());
        insert oppTeam;
        for(Opportunity opp:oppList){
            opp.StageName='Closed Won';
        }
        
        update oppList;
        
        Test.stopTest();
    }
}