public with sharing class AccountViewController {

    // This wrapper class holds data needed by the front end.
    public class AccountViewDetails {
        @AuraEnabled public Account accountRecord; // Hold Account Record
        @AuraEnabled public Boolean isHighNetWorthClient; // Indicates if account qualifies as high net worth
        @AuraEnabled public Boolean canEditHighNetWorthClient; // True if user has custom permission
        @AuraEnabled public String displayMode; // what the UI what to show
        @AuraEnabled public Boolean hasRecordAccess; // Whether the user can access the record
    }

    private static final Decimal HIGH_NET_WORTH_THRESHOLD = 1000000;
    private static final String HNW_CUSTOM_PERMISSION = 'High_Net_Worth_Client_Service_Representative';

    @AuraEnabled(cacheable=true)
    public static AccountViewDetails getAccountDetails(String accountId) {
        AccountViewDetails details = new AccountViewDetails();

        // Intializing default values
        details.hasRecordAccess = false; 
        details.isHighNetWorthClient = false;
        details.canEditHighNetWorthClient = false;

        //  This Query respects the user's sharing and permissions
        List<Account> accessibleAccounts = [SELECT Id FROM Account WHERE Id = :accountId WITH USER_MODE];
        if (accessibleAccounts.isEmpty()) {
            details.displayMode = 'insufficient_privileges';
            
            return details; // User does not have access to the record
        }
        details.hasRecordAccess = true;

        //  Get Account and related Opportunities Using WITH SECURITY_ENFORCED to respect FLS and Sharing for fields selected
        try {
            details.accountRecord = [
                SELECT Id, Name, Industry, AnnualRevenue, Phone, (
                    SELECT Amount, StageName
                    FROM Opportunities
                    WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost'
                )
                FROM Account
                WHERE Id = :accountId
                WITH SECURITY_ENFORCED
                LIMIT 1
            ];
        } 
        
        catch (System.QueryException e) {
            
            System.debug('QueryException accessing account or opportunity details: ' + e.getMessage());
            details.displayMode = 'insufficient_privileges'; 
            
            return details;
        }


        //  Calculating the Total Amount
        Decimal totalOpportunityAmount = 0;
        if (details.accountRecord != null && details.accountRecord.Opportunities != null) {
            for (Opportunity opp : details.accountRecord.Opportunities) {
                if (opp.Amount != null) {
                    totalOpportunityAmount += opp.Amount;
                }
            }
        }
        details.isHighNetWorthClient = totalOpportunityAmount > HIGH_NET_WORTH_THRESHOLD;

        // Check for Custom Permission
        Boolean hasCustomPermission = FeatureManagement.checkPermission(HNW_CUSTOM_PERMISSION);

        // Determine Display Mode
        if (!details.hasRecordAccess) { 
             details.displayMode = 'insufficient_privileges';
        } 
        
        // If the user has High Networth
        else if (details.isHighNetWorthClient) {
            if (hasCustomPermission) {
                details.displayMode = 'edit';
                details.canEditHighNetWorthClient = true;
            } else {
                details.displayMode = 'view';
            }
        }
        

        // Only View Mode
         else {
            
            details.displayMode = 'view'; 
        }
        return details;
    }
}