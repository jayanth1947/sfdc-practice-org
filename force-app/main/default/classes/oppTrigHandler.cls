/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
// Create a field on Opportunity Cleint Contact and once the client contact is updated then account client contact with same as Opportunity Client Contact. Trigger should be bulify and follow best practices
public with sharing class oppTrigHandler {
    public static void updateAccClient(List<Opportunity> oppList) {
        Set<Id> accIds = new Set<Id>();
        if(!oppList.isEmpty()){
            for(Opportunity opp:oppList){
                accIds.add(opp.AccountId);
            }
        }
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>();
        List<Account> updatedaccList = new List<Account>();
        if(!accIds.isEmpty()){
            List<Account> accList = [SELECT Id, Client_Contact__c FROM Account WHERE Id IN :accIds];
            if(!accList.isEmpty()){                
                for (Opportunity opp : oppList) {
                    if (opp.AccountId != null) {
                        oppMap.put(opp.AccountId, opp);
                    }
                }
                for (Account acc : accList) {
                    if (oppMap.containsKey(acc.Id)) {
                        acc.Client_Contact__c = oppMap.get(acc.Id).Client_Contact__c;
                        updatedaccList.add(acc);
                    }
                }
                }
            }
            if(!accList.isEmpty()){
                update updatedaccList;
            }
        }
    }
