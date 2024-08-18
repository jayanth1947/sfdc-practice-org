public class accountOwnerChangeTriggerHandler {

    	public static void afterUpdate(Map<Id, Account> oldAccounts, Map<Id, Account> newAccounts) {
        Set<Id> updatedAccountIds = new Set<Id>();
        
        // Collect Account IDs that had their owner changed
        for (Id accountId : newAccounts.keySet()) {
            if (oldAccounts.containsKey(accountId)) {
                if (newAccounts.get(accountId).OwnerId != oldAccounts.get(accountId).OwnerId) {
                    updatedAccountIds.add(accountId);
                }
            }
        }
        
        // Update related Contacts' owner if Account owner changed
        List<Contact> relatedContactsToUpdate = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :updatedAccountIds];
        for (Contact con : relatedContactsToUpdate) {
            con.OwnerId = newAccounts.get(con.AccountId).OwnerId;
        }
        
        // Perform bulk update
        update relatedContactsToUpdate;
    }
}