public class projectHandler {

    public static String findEarliestProject(){
        
        List<Project__c> projectList=[SELECT Id,Name,Start_Date__c,End_Date__c FROM Project__c ORDER BY Start_Date__c ASC LIMIT 1 ];
        
        if(!projectList.isEmpty()){
            
            System.debug(projectList[0].Name);
            return projectList[0].Name;
        }
        else{
            System.debug('No Projects Found');
            return 'No Projects Found';
        }
    }
}