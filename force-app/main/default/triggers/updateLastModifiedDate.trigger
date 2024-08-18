trigger updateLastModifiedDate on Account (after update) {
    // Get the list of Accounts that were updated
    List<Id> accountIds = new List<Id>();
    for (Account acc : Trigger.new) {
        accountIds.add(acc.Id);
    }

    // Query for all related Contacts
    List<Contact> contactsToUpdate = [SELECT Id, Last_Modified_Date__c FROM Contact WHERE AccountId IN :accountIds];

    // Update the LastModifiedDate field for each Contact
    for (Contact con : contactsToUpdate) {
        con.Last_Modified_Date__c = System.now();
    }

    // Update the Contacts in Salesforce
    update contactsToUpdate;
}