public class CaseHandler {
    
    public static void getAllCases(){
        List<Case> cas=[SELECT CaseNumber,Subject FROM Case];
        
        if(!cas.isEmpty()){
            for(Case ca:cas){
                System.debug(ca.CaseNumber + ' ' + ca.Subject);
            } 
        }
    }
}