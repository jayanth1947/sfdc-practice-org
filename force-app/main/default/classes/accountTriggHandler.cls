/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
public with sharing class accountTriggHandler {
    // There is a new field Account object called Asset Minimum expiry date which is a date field.
    // check the UsageEndDate on Asset and populate date on this new field on Account object.
    public  static void updateAssesExpiry(List<Account> accList) {
        Set<Id> accIds = new Set<Id>();
        if(!accList.isEmpty()){
            for(Account acc:accList){
                accIds.add(acc.Id);
            }
        }
        if(!accIds.isEmpty()){
            List<Asset> assetList = [SELECT Id, UsageEndDate, AccountId FROM Asset WHERE AccountId IN :accIds];
            for(Asset asset:assetList){
                Account acc = new Account(Id=asset.AccountId);
                acc.Asset_Minimum_Expiry_Date__c = asset.UsageEndDate;
                accList.add(acc);
            }
            if(!accList.isEmpty()){
                update accList;
            }
        } 

    }
}