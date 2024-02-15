// A class that tests the AccountUpdater class
@isTest
public class AccountUpdaterTest {
  // A test method that creates and executes the batch job
  @isTest static void testAccountUpdater() {
    // Create a large number of account records with different billing country values
    List<Account> accounts = new List<Account>();
    for (Integer i = 0; i < 1000; i++) {
      Account acc = new Account();
      acc.Name = 'Test Account ' + i;
      acc.BillingCountry = 'India';
      accounts.add(acc);
    }
    // Insert the account records
    insert accounts;

    // Create a new instance of the AccountUpdater class with the new billing country value
    AccountUpdater updater = new AccountUpdater('USA');
    // Execute the batch job with a batch size of 200 records
    Test.startTest();
    Database.executeBatch(updater, 200);
    Test.stopTest();

    // Query the updated account records
    List<Account> updatedAccounts = [SELECT Id, Name, BillingCountry FROM Account];
    // Loop through the updated records and verify that the billing country field is updated
    for (Account acc : updatedAccounts) {
      System.assertEquals('USA', acc.BillingCountry, 'The billing country should be updated to USA');
    }
  }
}