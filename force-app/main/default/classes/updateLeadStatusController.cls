public class updateLeadStatusController {
    public static void mymethod(){
        list<lead> leadList = [SELECT Id,Name,LeadSource,Status FROM Lead];
        
        for(Lead lea:leadList){
            if( lea.LeadSource== 'Web'){
            lea.Status = 'Qualified';
             System.debug(lea.Status);
        }
        }
        
    }
}