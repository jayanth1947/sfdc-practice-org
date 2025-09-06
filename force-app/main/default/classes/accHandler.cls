public with sharing class accHandler {

    //This method is used to update the description field whenever account gets created
    public static void beforeTrigger(List<Account> accList) {
        for(Account acc: accList){
            //whenever the industry field is null and Industry is as media the rating is assigned to Hot
           if(acc.Industry !=null && acc.Industry=='Media'){
                acc.Rating='Hot';
           }
        }
    }

    // Creating opportunity when creating a new Account
    public static void newOpportunity(List<Account> accList) {

        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc:accList){
            Opportunity opp=new Opportunity();
            opp.Name=acc.Name;
            opp.StageName='Prospecting';
            opp.CloseDate=System.Today();
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }

        //Checking the new oppList
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }

    // This method is used to update the description when we update Phone field on Account Object
    public static void updatePhoneDescription(List<Account> newList,Map<Id,Account> oldMap) {
        for(Account acc:newList){
            //This condition is used to check for only when the phone field is changed
            if(oldMap!=null &&acc.Phone !=oldMap.get(acc.Id).phone){
                acc.Description='Phone is modified on Account';
            }
        }
    }
 
    // This method is used for updating the related Opportunity Phone Field when there is update in the Account Phone Field
    public static void updateRelatedOppPhone(List<Account> newList,Map<Id,Account> oldMap) {
        Map<Id, Account> accMap = new Map<Id, Account>();

        List<Opportunity> oppToBeUpdated = new List<Opportunity>();

        for (Account acc : newList) {
            //This condition is used to check for only when the phone field is changed
            if (oldMap!=null && acc.Phone !=oldMap.get(acc.Id).phone) {
                accMap.put(acc.id,acc);
            }
        }

        for(Opportunity opp:[SELECT Id, Account_Phone__c,AccountId FROM Opportunity WHERE AccountId IN :accMap.keySet()]){

            Opportunity opper=new Opportunity();

            if(accMap.containsKey(opp.AccountId)){
                opper.id=opp.id;
                opper.Account_Phone__c=accMap.get(opp.AccountId).Phone;
                oppToBeUpdated.add(opper);
            }
        }

        if(!oppToBeUpdated.isEmpty()){
            update oppToBeUpdated;
        }
    }
}