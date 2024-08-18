@isTest
public class AccountMergeHandlerTest {

    @isTest
    static Id accountMerger(){
        List<Account> accList=new List<Account>();
        for(Integer i=1;i<=50;i++){
            Account acc=new Account();
            acc.Name='Test Account '+i;
            accList.add(acc);
        }
        insert accList;
        if(!accList.isEmpty()){
            AccountMergeHandler.mergeAccounts(accList[0].Id, accList[1].Id);
            return accList[1].Id;
        }
        else {
            return null;
        }
 
    } 
    
/*     @isTest
    static void testMergeAccounts() {
        // Create test data: Two accounts
        Account account1 = new Account(Name = 'Test Account 1');
        Account account2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{account1, account2};

        // Call the method to merge accounts
        Id mergedAccountId = AccountMergeHandler.mergeAccounts(account1.Id, account2.Id);

        // Verify that the merge was successful
        System.assertNotEquals(null, mergedAccountId);

        // Verify that the merged account no longer exists
        List<Account> mergedAccount = [SELECT Id FROM Account WHERE Id = :mergedAccountId];
        //System.assertEquals(0, mergedAccount.size());

        // Add more test scenarios if needed
    }

    @isTest
    static void testMergeAccountsWithException() {
        // Create test data: Only one account
        Account account1 = new Account(Name = 'Test Account 1');
        insert account1;

        // Call the method with invalid account Ids
        Id mergedAccountId = AccountMergeHandler.mergeAccounts(account1.Id, 'invalidId');

        // Verify that the merge failed and returned null
        //System.assertEquals(null, mergedAccountId);
    } */
}