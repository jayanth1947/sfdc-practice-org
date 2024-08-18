public class caseAfterInsertHandler {

    public static void updateCaseNumberOnAccount(List<Case> caseList){
        List<Account> accList=new List<Account>();
        for(Case ca:caseList){
            if(ca.AccountId!=null){
                Account acc=new Account();
                acc.Id=ca.AccountId;
                acc.Latest_Case_Number__c=ca.CaseNumber;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
        
    }
}