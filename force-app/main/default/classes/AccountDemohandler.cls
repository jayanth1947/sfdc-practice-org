// This is a class that contains methods to be called by the trigger
public class AccountDemohandler {
    
    // This method is called before insert event and updates the rating field of the account if its Industry is Media
    public static void beforeInsert(List<Account> newList){
        for(Account acc:newList){
            if(acc.Industry!=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }
        }   
    }
    
    // This method is called after insert event and creates a new opportunity for each inserted account
    public static void afterInsert(List<Account> newList){
        List<Opportunity> oppInsert=new List<Opportunity>();
        for(Account acc:newList){
            
            //This line creates a new Opportunity object and assigns it to the opp variable.
            Opportunity opp=new Opportunity();
            
            // This line sets the Name field of the opportunity to be the same as the Name field of the current account acc.
            opp.Name=acc.Name;
            
            //This line sets the AccountId field of the opportunity to be the Id of the current account acc. This links the opportunity to the account.
            opp.AccountId=acc.Id;
            
            //This line sets the StageName field of the opportunity to be 'Prospecting'. This indicates the current stage of the sales process for the opportunity.
            opp.StageName='Prospecting';
            
            //This line sets the CloseDate field of the opportunity to be today's date.
            opp.CloseDate=System.today();
            
            //This line adds the new opportunity opp to a list called oppInsert. This list will be used to insert the new opportunities into the database after the loop is finished.
            oppInsert.add(opp);
        }
        
         // If there are new opportunities to be inserted, insert them
        if(!oppInsert.isEmpty()){
            insert oppInsert;
        }
    }
  
    
    public static void updatePhoneDescription(List<Account> newList,Map<Id,Account> oldMap) {
        for(Account acc:newList){
            
            /*oldMap!=null: This checks that the oldMap variable is not null.
			oldMap is a map that contains the previous field values for the accounts being updated.
			acc.Phone!=oldMap.get(acc.Id).Phone: This checks if the Phone field of the current account acc is not equal
			to its previous value in the database. The oldMap.get(acc.Id) statement gets the previous version of the current 
			account from the oldMap variable, and oldMap.get(acc.Id).Phone retrieves the Phone field from the previous version.*/
            
            if(oldMap!=null && acc.Phone!=oldMap.get(acc.Id).Phone){
                acc.Description='Phone field is changed'; // updated description
            }
        }
        
    }
    
    
    public static void populateRelatedOpp(List<Account> newList, Map<Id, Account> oldMap) {
    Map<Id, Account> accIdMap = new Map<Id, Account>(); //Map for the Ids of the account
    List<Opportunity> oppTobeUpdated = new List<Opportunity>(); //Updated Opportunity

    // Loop through the list of Accounts
    for (Account acc : newList) {
        // Check if oldMap is not null and if the Phone field has changed
        if (oldMap != null && acc.Phone != oldMap.get(acc.Id).Phone) {
            // Add the Account to the map
            accIdMap.put(acc.Id, acc);
        }
    }

    // Query for Opportunities related to the Accounts in the map
    List<Opportunity> oppList = [SELECT Id, Account_Phone__c, AccountId FROM Opportunity WHERE AccountId IN :accIdMap.keySet()];

    // Loop through the list of Opportunities
    for (Opportunity opp : oppList) {
        // Check if the Opportunity's Account is in the map
        if (accIdMap.containsKey(opp.AccountId)) {
            Opportunity oppor = new Opportunity(); // Create a new Opportunity for each iteration
            oppor.Id = opp.Id; //Account Id=Opp Id 
            
            /* oppor.Account_Phone__c: This is accessing the Account_Phone__c field on the oppor Opportunity record.
             
			accIdMap.get(opp.AccountId): This is getting the related Account record from the accIdMap map using the 
			AccountId field on the current Opportunity record (opp) as the key.
		
			.Phone: This is accessing the Phone field on the related Account record.*/
            oppor.Account_Phone__c = accIdMap.get(opp.AccountId).Phone; // Use the correct map key     
            oppTobeUpdated.add(oppor);
        }
    }

    // Check if there are any Opportunities to update before updating them
    if (!oppTobeUpdated.isEmpty()) {
        update oppTobeUpdated;
    }
}
    
    public static void deleteEmployees(List<Account> accList){
        
        List<Employee__c> deletedEmp=new List<Employee__c>();
        
        for(Account acc:accList){
            for(Employee__c emp:[SELECT Id,Account_Employee__c from  Employee__c where Name=: acc.Id]){
                deletedEmp.add(emp);
            }
        }
        if(deletedEmp.size()>0){
             delete deletedEmp;
        }
           
        }
           
}