public class LeadDeduplicator {

    public static void findDuplicates(){
        List<Lead> leadList =[SELECT Id,Name,Industry,Status,LeadSource FROM Lead];
        
        Set<String> leadSet=new Set<String>();
       Integer count=0;
        for(Lead lea:leadList){
            if(leadSet.contains(lea.Name)){
                leadSet.add(lea.Name);
                count++;
            }
        }
        System.debug(count);
    }
}