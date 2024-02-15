public class AccountDuplicator {

    public static Id duplicateAccount(Id accountId) {
        Account originalAccount = [SELECT Id, Name, OwnerId, Phone, Industry FROM Account WHERE Id = :accountId];

        if (originalAccount == null) {
            System.debug('Error: Account with Id ' + accountId + ' not found.');
            return null;
        }
        // Create a new account with copied data
        Account newAccount = new Account();
        newAccount.Name = originalAccount.Name + ' (Copy)';
        newAccount.OwnerId = originalAccount.OwnerId;
        newAccount.Phone = originalAccount.Phone;
        newAccount.Industry = originalAccount.Industry;
   
        System.debug('Creating new account with Name: ' + newAccount.Name);

        try {
            insert newAccount;
            System.debug('New account created: ' + newAccount.Id);
            return newAccount.Id;
        } catch (DmlException e) {
            System.debug('Error creating new account: ' + e.getMessage());
            return null;
        }
    }
}