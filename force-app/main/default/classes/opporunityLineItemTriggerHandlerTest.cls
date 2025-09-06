@isTest
private class opporunityLineItemTriggerHandlerTest {


@IsTest
    static void testInsertQuatationRecord() {
        List<OpportunityLineItem> opliList = [SELECT Id, OpportunityId, Opportunity.Name FROM OpportunityLineItem];
        Test.startTest();
        opporunityLineItemTriggerHandler.insertQuatationRecord(opliList);
        Test.stopTest();
        List<Quotation__c> quotationList = [SELECT Id, Opportunity_Line_Item__c, Name FROM Quotation__c];
        System.assertEquals(opliList.size(), quotationList.size(), 'Quotation records not inserted correctly');
    }
}