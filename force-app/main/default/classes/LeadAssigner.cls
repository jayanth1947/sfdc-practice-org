public class LeadAssigner {
    public static void assignLeads(String criteria){
        
        List<Lead> leadList =[SELECT Id, Name,Company,Status,OwnerId FROM Lead WHERE Status=:criteria];
        
        Integer count=0;
        for(Lead lea:leadList){
            count++;
            lea.OwnerId='0055h000005jhcT';
             System.debug(lea.OwnerId);
        }
        System.debug(count);
       
    }
}