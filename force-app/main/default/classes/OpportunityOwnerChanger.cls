public class OpportunityOwnerChanger {

    public static void changeOpportunityOwner(String userId){
        List<Opportunity> oppList =[SELECT Id,Name,OwnerId FROM Opportunity];
        
        for(Opportunity opp:oppList){
            opp.OwnerId=userId;
        }
        System.debug(oppList);
    }
}