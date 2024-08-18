@isTest
public with sharing class accountOwnerChangeTriggerHandlerTest {
    
   
    @testSetup
    static void testSetup() {
        // Create a test user with administrator privileges.
        Profile standardUserProfile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        User ownerChangeUser = new User(
            FirstName = 'Owner',
            LastName = 'Change',
            Email = 'ownerchange@gmail.com',
            Username = 'owner1212@gmail.com',
            Alias = 'ochange',
            ProfileId = standardUserProfile.Id,
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles'
        );
        insert ownerChangeUser;
    }

    @isTest
    static void testAccountOwnerChange() {
        User ownerUser = [SELECT Id FROM User WHERE FirstName = 'Owner' AND LastName = 'Change' LIMIT 1];
        Account newAccount = new Account(Name = 'Test Account', OwnerId = ownerUser.Id);
        insert newAccount;

        // Simulate a change in the OwnerId field
        Account oldAccount = newAccount.clone(true); //Performing deep clone
        oldAccount.OwnerId = UserInfo.getUserId();
        newAccount.OwnerId = ownerUser.Id;

        // Call the trigger handler
        Test.startTest();
        accountOwnerChangeTriggerHandler.afterUpdate(new Map<Id,Account>{oldAccount.Id => oldAccount}, new Map<Id,Account>{newAccount.Id => newAccount});
        Test.stopTest();
        
            
}
}