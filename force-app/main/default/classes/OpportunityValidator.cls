//Write an Apex class called "OpportunityValidator" that validates whether an Opportunity record meets certain criteria. 
//Implement a method called "validateOpportunity" that returns true if the Opportunity is valid, and false otherwise.
public class OpportunityValidator {
    public static void validateOpportunity(){
        
        List<Opportunity> oppList =[SELECT Id,Name,StageName,CloseDate,Amount FROM Opportunity];
        for(Opportunity opp:oppList){
            if(opp.Amount >=10000){
                System.debug(opp.Name+ opp.Amount +'True');      
            }
            else{
                System.debug('False');
            }
        }
    }
    
    
    
}