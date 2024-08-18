public class LeadConvertedHandler {

    public static void updateConverted(List<Lead> leadList){
        
        for(Lead lea:leadList){
            if(lea.Status =='Closed - Converted'){
                lea.Lead_Converted__c=true;
            }
        }
    }
}