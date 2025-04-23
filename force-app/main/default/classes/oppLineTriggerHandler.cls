/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
// Create a field on OpportunityLineItem as Serial Number and populate increment values when a new OpportunityLineItem is created.
// The logic ensures that sequence numbers are assigned incrementally based on the order of creation.
// If an item is deleted, the sequence numbers of remaining items are not adjusted, preserving gaps in the sequence.
public with sharing class OppLineTriggerHandler {
    public static void updateSerialNumber(List<OpportunityLineItem> oppLineList) {
        // Method inside OppLineTriggerHandler class

        Set<Id> oppIds = new Set<Id>();
        if(!oppLineList.isEmpty()){ 
            for(OpportunityLineItem oppLine:oppLineList){
                oppIds.add(oppLine.OpportunityId);
            }
        }
        if(!oppIds.isEmpty()){
            List<OpportunityLineItem> updateOppLineList = new List<OpportunityLineItem>();
            Map<Id, Integer> sequenceTracker = new Map<Id, Integer>();
            List<OpportunityLineItem> oppLineItemList = [SELECT Id, OpportunityId, Serial_Number__c, CreatedDate FROM OpportunityLineItem WHERE OpportunityId IN :oppIds ORDER BY OpportunityId, CreatedDate];
            for(OpportunityLineItem oppLineItem:oppLineItemList){
                Integer seqNum = sequenceTracker.get(oppLineItem.OpportunityId);
                if (seqNum == null) {
                    seqNum = 0;
                }
                seqNum += 1;
                oppLineItem.Serial_Number__c = seqNum;
                sequenceTracker.put(oppLineItem.OpportunityId, seqNum);
            }
            for(OpportunityLineItem oppLineItem:oppLineItemList){
                updateOppLineList.add(oppLineItem);
            }
            update updateOppLineList;
            
               if(!updateOppLineList.isEmpty()){
                Integer batchSize = 200; // Define a batch size
                for (Integer i = 0; i < updateOppLineList.size(); i += batchSize) {
                    List<OpportunityLineItem> batch = updateOppLineList.subList(i, Math.min(i + batchSize, updateOppLineList.size()));
                    Database.update(batch, false); // Perform partial updates
                }
            }
        }
    }
}
