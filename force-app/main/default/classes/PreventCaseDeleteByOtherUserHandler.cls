public class PreventCaseDeleteByOtherUserHandler {

    public static void preventOtherUserToDelete(List<Case> oldCaseList){
        Id currentUserProfileId= UserInfo.getProfileId();
        Id systemAdminProfileId=[SELECT Id,Name FROM Profile WHERE Name='System Administrator' LIMIT 1].Id;
        for(Case caseRec:oldCaseList){
            if(systemAdminProfileId !=currentUserProfileId){
                caseRec.addError('You dont have the rights to delete');
            }
        }
        
    }
}