public class AccountMergeHandler {
    
    public static Id mergeAccounts(Id accountId1,Id accountId2){
        Account accList1=[SELECT Id,Name FROM Account WHERE Id=:accountId1];
        Account accList2=[SELECT Id,Name FROM Account WHERE Id=:accountId2];
        
        try{
            merge accList2 accList1;
            System.debug('Merged Account Id '+accList2.Id);
            return accList2.Id;
        }
        catch (Exception e) {
            // Handle exception
            System.debug('An error occurred while merging the accounts: ' + e.getMessage());
            return null;
        }
    }
}