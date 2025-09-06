/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
// First make the Account as private in OWD and once you create a account it should be shared with other user also. For example Sales user is 
// created an account and this should be shared with billing user and this should be done using trigger.
public with sharing class accTrigerHandlerclass {
     public static void accShare(List<Account> accList) {
        if(!accList.isEmpty()){
            for(Account acc:accList){
                // Create the object for the account sharing model
                AccountShare accShare = new AccountShare();
                accShare.AccountId = acc.Id; // Set the ID of the account being shared
                accShare.UserOrGroupId = '0051t00000A1B2C'; // Set the ID of the user or group with whom the account is being shared
                accShare.AccountAccessLevel = 'Read'; // Set the access level for the user or group
                accShare.OpportunityAccessLevel = 'Read'; // Set the access level for the opportunity associated with the account
                accShare.CaseAccessLevel = 'Read'; // Set the access level for the case associated with the account
                accShare.ContactAccessLevel = 'Read'; // Set the access level for the contact associated with the account               
                accShare.ShareType = 'Read'; // Set the share type for the account
                accShare.RowCause = Schema.AccountShare.RowCause.Manual; // Set the reason for sharing the account
                accShare.ParentId = acc.Id; // Set the parent ID for the account share
                accShare.Parent = acc; // Set the parent account for the account share
                accShare.ParentType = 'Account'; // Set the parent type for the account share
                accShare.ParentId = acc.Id; // Set the parent ID for the account share
                  
                // Insert the account share record
                try {
                    insert accShare;
                } catch (DmlException e) {
                    // Handle any exceptions that occur during the insert operation
                    System.debug('Error inserting account share: ' + e.getMessage());
                }

     }
}
     }
    }