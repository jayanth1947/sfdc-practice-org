public with sharing class auraAccountController {
    
        @AuraEnabled
        public static List<Account> getAccounts(){

            List<Account> accList = new List<Account>();

            //This will retrive the records of the accounts
            accList=[select Id,Name,Phone from Account LIMIT 5];
            return accList;

        }

    }