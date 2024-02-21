public class addOpportunityTeamMembersHandler {

    public static void addTeamMembers(List<Opportunity> newoppList,Map<Id,Opportunity> oldOppMap){
        
        List<OpportunityTeamMember> newOppTeamList =new List<OpportunityTeamMember>();

        //Getting the Users List
		List<User> 	userList=[SELECT Id,UserRole.Name FROM User WHERE UserRole.Name='Opportunits'];    

        for(Opportunity opp:newoppList){
            //Checking if the stageName and Old StageName conditions
            if(opp.StageName != oldOppMap.get(opp.Id).StageName && opp.StageName=='Needs Analysis'){
                for(User userRec:userList){
                    //Creating a new OpportunityTeamMember
                    OpportunityTeamMember oppTeamMember=new OpportunityTeamMember();
                    oppTeamMember.OpportunityId=opp.Id;
                    oppTeamMember.OpportunityAccessLevel='Edit';
                    oppTeamMember.UserId=userRec.Id;
                    newOppTeamList.add(oppTeamMember);
                }
            }
        }
        
        //Inserting into the database.
        if(!newOppTeamList.isEmpty()){
            insert newOppTeamList;
        }
    }
}