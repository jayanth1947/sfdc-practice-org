@isTest
public class updateCaseStatusHandlerTest {
    
    @isTest
    static void updateCaseStatus(){
        
        List<Case> casList=new List<Case>();
        
        Case cas1=new Case();
        cas1.Priority='High';
        Case cas2=new Case();
        cas2.Priority='Low';
        Case cas3=new Case();
        cas3.Priority='Normal';
        
        casList.add(cas1);
        casList.add(cas2);
        casList.add(cas3);
        
        insert casList;
        List<Case> newCases=[SELECT Id,Priority,Status FROM Case];
        updateCaseStatusHandler.updateCaseStatus(newCases);
        
        for(Case cas:newCases){
            if(cas.Priority=='High'){
                cas.Status='Escalated';
                System.debug(cas.Status);
            }
            
        }
        
        
    }
}