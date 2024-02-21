trigger addOpportunityTeamMembersTrigger on Opportunity (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        addOpportunityTeamMembersHandler.addTeamMembers(Trigger.new, Trigger.oldMap);
    }
}