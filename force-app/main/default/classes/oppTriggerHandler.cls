/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 05-02-2025
 * @last modified by  : Jayanth Onteru
**/
public with sharing class oppTriggerHandler {
    // Collect all the opportunity line items quantity and update the Account field Total Quantity and total number and bulkify the trigger
    public static void updateTotalNumber(List<OpportunityLineItem> oppLineItemList) {
        Set<Id> oppIds = new Set<Id>();
        for (OpportunityLineItem oppLine : oppLineItemList) {
            if (oppLine.OpportunityId != null && oppLine.Quantity != null) {
                oppIds.add(oppLine.OpportunityId);
            }
        }

        if (!oppIds.isEmpty()) {
            List<Opportunity> oppList = [SELECT Id, Opportunity.AccountId FROM Opportunity WHERE Id IN :oppIds];
            Map<Id, Decimal> oppQtyMap = new Map<Id, Decimal>();
            Map<Id, Decimal> oppNumMap = new Map<Id, Decimal>();

            for (Opportunity opp : oppList) {
                oppQtyMap.put(opp.Id, 0);
                oppNumMap.put(opp.Id, 0);
            }

            for (OpportunityLineItem oppLine : oppLineItemList) {
                if (oppLine.OpportunityId != null && oppLine.Quantity != null) {
                    Decimal qty = oppQtyMap.get(oppLine.OpportunityId);
                    Decimal num = oppNumMap.get(oppLine.OpportunityId);
                    qty += oppLine.Quantity;
                    num += 1;
                    oppQtyMap.put(oppLine.OpportunityId, qty);
                    oppNumMap.put(oppLine.OpportunityId, num);
                }
            }

            List<Account> accoUpdate = new List<Account>();
            for (Opportunity opp : oppList) {
                Account acc = new Account(Id=opp.AccountId);
                acc.Total_Quantity__c = oppQtyMap.get(opp.Id);
                acc.Total_Number__c = oppNumMap.get(opp.Id);
                accoUpdate.add(acc);
            }

            if (!accoUpdate.isEmpty()) {
                update accoUpdate;
            }
        }
    }


}