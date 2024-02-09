public class checkLeadStatus {

    public static Boolean checkLead(List<Lead> leadList){
        
        for(Lead lea:leadList){
            if(lea.Status=='Working - Contacted'){
                System.debug(lea.Name);
                return true;
            }
        }
        return false;
    }
}