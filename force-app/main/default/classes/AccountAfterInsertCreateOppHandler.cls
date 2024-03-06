public class AccountAfterInsertCreateOppHandler {

    public static void createOpportunity(List<Account> accList){
        List<Opportunity> oppList= new List<Opportunity>();
        for(Account acc:accList){
            Opportunity opp=new Opportunity();
            opp.Name=acc.Name;
            opp.StageName='Prospecting';
            opp.CloseDate=system.today();
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }
        
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}