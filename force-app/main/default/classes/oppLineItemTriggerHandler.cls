/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
// Write a trigger on OpportunityLineItem when this is tagged  to a account and create an new Assest record and bulky the trigger
public with sharing class oppLineItemTriggerHandler {
     public static void createAssest(List<OpportunityLineItem> oppLineList) {
        Set<Id> oppIds = new Set<Id>();
         if(!oppLineList.isEmpty()){
             for(OpportunityLineItem oppLine:oppLineList){
                    oppIds.add(oppLine.OpportunityId);
                }
    }
     
        if(!oppIds.isEmpty()){
            List<Opportunity> oppList = [SELECT Id, AccountId FROM Opportunity WHERE Id IN :oppIds];
            List<Asset> assetList = new List<Asset>();
            for(Opportunity opp:oppList){
                Asset asset = new Asset();
                asset.AccountId = opp.AccountId;
                asset.OpportunityId = opp.Id;
                assetList.add(asset);
            }
            if(!assetList.isEmpty()){
                insert assetList;
            }
        }
    }
}