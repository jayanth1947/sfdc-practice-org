public with sharing class caseTriggerTwoHandler {
    
    public static void updateRatingOnAccount(List<Case> newCaseList, Map<Id,Case> oldCaseMap) {
        
        Set<Id> accIds = new Set<Id>();
        Map<Id, Integer> accountCaseCountMap = new Map<Id, Integer>();
        List<Account> listToUpdateAccount = new List<Account>();

        if (!newCaseList.isEmpty()) {
            for (Case newCase : newCaseList) {
                if (oldCaseMap !=null) {
                    Case oldCase=oldCaseMap.get(newCase.Id);

                    if (newCase.AccountId !=oldCase.AccountId) {
                        accIds.add(newCase.AccountId);
                        accIds.add(oldCase.AccountId);
                    }
                    else if (oldCase.IsClosed !=newCase.IsClosed) {
                        accIds.add(newCase.AccountId);
                    }
                }

                else if(newCase.IsClosed==true) {
                    accIds.add(newCase.AccountId);
                }
            }
        }

        if (!accIds.isEmpty()) {
         
            for (AggregateResult result : [SELECT AccountId,Count(Id) caseCount FROM Case 
                                           WHERE AccountId IN: accIds AND IsClosed=true GROUP BY AccountId]) {
                Id accountId =(Id) result.get('AccountId');
                Integer caseCount=(Integer) result.get('caseCount');
                accountCaseCountMap.put(accountId,caseCount);
            }

            List<Account> accList=[SELECT Id,Rating FROM Account WHERE Id IN: accIds];

            if (!accList.isEmpty()) {
                for (Account acc : accList) {
                    
                    //checking whether the map contains the particular key or not and return default value 0 to it.
                    Integer closedCaseCount=accountCaseCountMap.containsKey(acc.Id) 
                                            ? accountCaseCountMap.get(acc.Id) : 0;
                    String accountRating;

                    if (closedCaseCount >5) {
                        accountRating='Hot';
                    }
                    else if (closedCaseCount>2) {
                        accountRating='Warm';
                    }
                    else{
                        accountRating='Cold';
                    }
                    acc.Rating=accountRating;
                    listToUpdateAccount.add(acc);
                }
            }
        }

        if (!listToUpdateAccount.isEmpty()) {
            update listToUpdateAccount;
        }
    }
}