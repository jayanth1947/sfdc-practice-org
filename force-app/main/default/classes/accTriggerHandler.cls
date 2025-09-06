public with sharing class accTriggerHandler {
    
    //Deleting the Opportunities based on the Account Status
    public static void deleteOpps(List<Account> newAccList,Map<Id,Account> oldAccMap) {
       //Set the variables for the class
        Set<Id> accIds = new Set<Id>();
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        List<Contact> listToUpdateContact = new List<Contact>();

        //checking if the list is empty or not
        if (!newAccList.isEmpty()) {
            for (Account newAcc : newAccList) {
                if (!oldAccMap.isEmpty()) {
                    Account oldAcc=oldAccMap.get(newAcc.Id);

                    if (newAcc.Status__c == 'Inactive' && oldAcc.Status__c =='Active') {
                        accIds.add(newAcc.Id); //Ids are added to the set
                    }
                }
            }
        }

        //If the set is empty then enter the statement
        if (!accIds.isEmpty()) {

            //Retrive the Contact Records 
           conList =[SELECT Id,Do_not_Contact__c FROM Contact WHERE AccountId IN: accIds AND
                    Do_not_Contact__c =false];
            
            //Retrive the Opportunity Records
            oppList=[SELECT Id FROM Opportunity WHERE AccountId IN:accIds AND
                    StageName !='Closed Won'];
            
            if (!conList.isEmpty()) {
                for (Contact con : conList) {
                    con.Do_not_Contact__c=true;
                    listToUpdateContact.add(con);
                }
            }

            try {
                if (!listToUpdateContact.isEmpty()) {
                    update listToUpdateContact; //update the list
                }

                if (!oppList.isEmpty()) {
                    delete oppList; //delete the opportunity list
                }
            }
            catch (Exception ex) {
                System.debug('Error While doing updation or deletion -->'+ex.getMessage());
            }
        }
    }
}