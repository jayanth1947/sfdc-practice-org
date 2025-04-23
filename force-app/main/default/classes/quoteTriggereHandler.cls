/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
// Create a field on Quote as Serial Number and populate increment values when a new Quote is created.
// The logic ensures that sequence numbers are assigned incrementally based on the order of creation.
// If an item is deleted, the sequence numbers of remaining items are not adjusted, preserving gaps in the sequence.
public with sharing class quoteTriggereHandler {
        public static void updateSerialNumber(List<Quote> quoteList) {
                Set<Id> quoteIds = new Set<Id>();
            if(!quoteList.isEmpty()){
                for(Quote quote:quoteList){
                    quoteIds.add(quote.Id);
                }
            }
            if(!quoteIds.isEmpty()){
                List<Quote> updateQuoteList = new List<Quote>();
                Map<Id, Integer> sequenceTracker = new Map<Id, Integer>();
                List<Quote> quoteItemList = [SELECT Id, Serial_Number__c, CreatedDate FROM Quote WHERE Id IN :quoteIds ORDER BY CreatedDate];
                for(Quote quoteItem:quoteItemList){
                    Integer seqNum = sequenceTracker.get(quoteItem.Id);
                    if (seqNum == null) {
                        seqNum = 0;
                    }
                    seqNum += 1;
                    quoteItem.Serial_Number__c = seqNum;
                    sequenceTracker.put(quoteItem.Id, seqNum);
                }
                for(Quote quoteItem:quoteItemList){
                    updateQuoteList.add(quoteItem);
                }

                if(!updateQuoteList.isEmpty()){
                    update updateQuoteList;
                }
        }
}
}