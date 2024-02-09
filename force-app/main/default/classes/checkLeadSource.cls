public class checkLeadSource {
    public static Boolean checkLead(List<Lead> leadList){
        
        for(Lead lea:leadList){
            if(lea.LeadSource=='Web'){
                System.debug(lea.LastName);
                return true;
            }
        }
        return false;
    }
}