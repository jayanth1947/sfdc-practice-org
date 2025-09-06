public with sharing class opportunutyTriggerPracticeHandler {
    public static void updateDescription(List<Opportunity> oppList) {
        
        for (Opportunity opp : oppList) {
            if (opp.Amount !=null && opp.Amount>100000) {
                opp.Description='Hot Opportunity';
            }
        }
    }

    
    //update amount in the latest in the account record
    public static void updateAmount(List<Opportunity> oppList) {
        
        List<Account> accList = new List<Account>();
        for (Opportunity opp : oppList) {
            if (opp.Amount!=null && opp.AccountId!=null) {
                Account acc=new Account();
                acc.Recent_Opportunity_Amount__c=opp.Amount;
                acc.Id=opp.AccountId;
                accList.add(acc);
            }
        }

        if (!accList.isEmpty()) {
            update accList;
        }
    }


    public static void updateOppDescription(List<Opportunity> oppList,Map<Id,Opportunity> oldOppMap) {
        
        for (Opportunity opp : oppList) {
            if (opp.StageName!=null && opp.StageName!=oldOppMap.get(opp.Id).StageName) {
                if (opp.StageName=='Closed Won') {
                    opp.Description='Opportunity is Closed Won';
                }
                 else if (opp.StageName=='Closed Lost') {
                    opp.Description='Opportunity is Closed Lost';
                }else {
                    opp.Description='Opportunity is Open';
                }
            }
        }
    }

    public static void createTask(List<Opportunity> oppList,Map<Id,Opportunity> oldOppMap) {
        
        List<Task> tasList = new List<Task>();
        for (Opportunity opp : oppList) {
            if (opp.StageName!=null &opp.StageName!=oldOppMap.get(opp.Id).StageName) {
                Task tas=new Task();
                tas.Status='Not Started';
                tas.Subject='Trigger Task';
                tas.Priority='High';
                tas.WhatId=opp.Id;
                tas.OwnerId=UserInfo.getUserId();
                tasList.add(tas);
            }
        }

        if (!tasList.isEmpty()) {
            insert tasList;
        }
    }

    public static void preventDeleteOpp(List<Opportunity> oppList) {
        
        Profile pro=[SELECT Id FROM Profile WHERE Name='System Administrator'];
        for (Opportunity opp : oppList) {
            if (opp.StageName=='Closed Won' || opp.StageName=='Closed Lost') {
                if (userInfo.getProfileId()!=pro.Id) {
                    opp.addError('You are not allowed to delete.Please Contact System Administrator');
                }
            }
        }
    }
}