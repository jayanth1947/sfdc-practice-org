public class createAndUpdateOpportunity {

    public static void updateOpp(){
        
        List<Opportunity> oppList =[SELECT Id,Name,StageName,AccountId,Account.active_p__c,Account.Name FROM Opportunity WHERE Account.active_p__c=true];
        
        List<Opportunity> newOppList= new List<Opportunity>();
        for(Opportunity opp:oppList){
            if(opp.AccountId ==null){
                opp.StageName='Prospecting';
            }
            Opportunity newOpp=new Opportunity();
            newOpp.Name='New Opp';
            newOpp.StageName='Qualification';
            newOpp.CloseDate=System.today();
            newOppList.add(newOpp);
        }
        insert newOppList;
        System.debug('New Opp List '+newOppList);
    }
}