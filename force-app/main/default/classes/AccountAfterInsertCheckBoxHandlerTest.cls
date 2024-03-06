@isTest
public class AccountAfterInsertCheckBoxHandlerTest {

    @isTest
    static void createConAndOpp(){
        List<Account> accList=new List<Account>();
        List<Opportunity> oppList=new List<Opportunity>();
        List<Contact> conList=new List<Contact>();
        
        for(Integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='Account '+i;
            if(Math.mod(i,2) ==0){
               acc.New_Contact__c=true; 
            }
            else{
                acc.New_Opportunity__c=true;
            }
            
            accList.add(acc);
        }
        insert accList;
        
        
        List<Contact> updateConList=[SELECT Id,LastName FROM Contact WHERE AccountId =:accList[0].Id];
        
        List<Opportunity> updateOppList=[SELECT Id,Name FROM Opportunity WHERE AccountId =:accList[1].Id];
        
        Assert.areEqual(updateConList[0].LastName,accList[0].Name);
        Assert.areEqual(updateOppList[0].Name,accList[1].Name);
    }
}