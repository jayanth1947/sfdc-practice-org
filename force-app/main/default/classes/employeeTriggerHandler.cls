public class employeeTriggerHandler {
    public static void checkEmployeeStatus(List<Employee__c> oldList){
        for(Employee__c emp:oldList){
            if(emp.Active__c==true){
                emp.addError('Active Employee Can not be deleted');
            }
        }
    }
}

/*
 * trigger AccountAfterDelete on Account (after delete) {
    // Create a set to store the Ids of the deleted Accounts
    Set<Id> deletedAccountIds = new Set<Id>();

    // Loop through the list of deleted Accounts and add their Ids to the set
    for (Account acc : Trigger.old) {
        deletedAccountIds.add(acc.Id);
    }

    // Query for Contacts related to the deleted Accounts
    List<Contact> contactsToUpdate = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :deletedAccountIds];

    // Loop through the list of Contacts and update their fields as needed
    for (Contact con : contactsToUpdate) {
        con.AccountId = null; // Clear the AccountId field
        // Add any other field updates here
    }

    // Update the Contacts
    update contactsToUpdate;
}
*/