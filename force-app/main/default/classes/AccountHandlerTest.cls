@isTest
private class AccountHandlerTest {

    @isTest
    static void testCreateAccount() {
        Test.startTest();
        AccountHandler.createAccount();
        Test.stopTest();

        List<Account> insertedAccounts = [SELECT Id, Name FROM Account WHERE Name = 'New Account Trigger'];
        System.assertEquals(1, insertedAccounts.size());
        System.assertEquals('New Account Trigger', insertedAccounts[0].Name);
    }
    
    @isTest
    static void testCreateContact() {

        // Create a test account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Create a list of accounts to pass to the method
        List<Account> accList = new List<Account>();
        accList.add(testAccount);

        // Call the method to create contacts
        Test.startTest();
        AccountHandler.createContact(accList);
        Test.stopTest();
        

        // Verify that contacts were created
        List<Contact> createdContacts = [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId = :testAccount.Id];
        System.assertEquals(1, createdContacts.size(), 'Expected one contact to be created');
        System.assertEquals('New Account Contact Record', createdContacts[0].LastName, 'Contact last name should match');
    }
    
}