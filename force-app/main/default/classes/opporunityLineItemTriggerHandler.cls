/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
public with sharing class opporunityLineItemTriggerHandler {
    public static void deleteOppOnOPLIDeletedL(List<OpportunityLineItem> oppLineItemList) {
        Set<Id> oppIds = new Set<Id>();
        if(!oppLineItemList.isEmpty()){
            for(OpportunityLineItem oppLineItem:oppLineItemList){
                oppIds.add(oppLineItem.OpportunityId);
            }
        }
        if(!oppIds.isEmpty()){
            List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE Id IN :oppIds];
            if(!oppList.isEmpty()){
                delete oppList;
            }
        }

    }

    public static void insertQuatationRecord(List<OpportunityLineItem> opliList){
        List<Quotation__c> quotationList = new List<Quotation__c>();
        for(OpportunityLineItem opli : opliList){
            Quotation__c quotation = new Quotation__c();
            quotation.Opportunity_Line_Item__c = opli.Id;
            quotation.Name = 'Quotation for ' + opli.Opportunity.Name;
            quotationList.add(quotation);
        }
        if(!quotationList.isEmpty()){
            insert quotationList;
        }
    }
}