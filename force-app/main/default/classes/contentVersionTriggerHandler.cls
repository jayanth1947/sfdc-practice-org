/*public class contentVersionTriggerHandler {
    
    //Here we are preparing the format of the images in a set
    public static Set<String> fileType=new Set<String>{'jpg','png','jpeg','svg','jfif'};
    
    //In this method it is accepting two parameter one is list and another one is map
    public static void createPublicLinkFile(List<ContentVersion> contentVersionList,Map<Id,ContentVersion> contentVersionMap){
        
        //Here we have created one more method i.e getcontentDocumentLinkMap
        Map<Id,ContentDocumentLink> contentDocumentLinkMap=getcontentDocumentLinkMap(contentVersionList);
        List<ContentDistribution> distributionInsert=new List<ContentDistribution>();
        
        for(contentVersion version:contentversionList){
            ContentDocumentLink link=contentDocumentLinkMap.get(contentVersionList);
            if(link.LinkedEntityId.getSObjectType()==Event__c.sObjectType
                                            || link.LinkedEntityId.getSObjectType()==Speaker__c.sObjectType
                                             || link.LinkedEntityId.getSObjectType()==Event_Organizer__c.sObjectType
              && fileType.contains(version.FileType.toLowerCase())){
                  distributionInsert.add(prepareContentDistribution(version.Id,version.Title));
        }
        
    }
        if(distributionInsert.size()>0){
            insert distributionInsert;
        }
    }
    
    public static ContentDistribution prepareContentDistribution(Id contentversionId,String title){
        ContentDistribution newDist=new ContentDistribution();
        newDist.contentVersionId=contentVersionId;
        newDist.Name=title;
        newDist.PreferencesNotifyOnVisit=false;
        newDist.PreferencesAllowOriginalDownload=true;
        return newDist;
    }
    
    public static Map<Id,ContentDocumentLink> getcontentDocumentLinkMap(List<ContentVersion> contentVersionList){
        
        Set<String> contentDocumentId=new Set<String>();
        
        for(contentVersion version:contentVersionList){
            contentDocumentId.add(version.ContentDocumentId);
        }
        
        //Creating a map for the contentMapDocument Link
        Map<Id,ContentDocumentLink> contentDocumentLinkMap=new Map<Id,ContentDocumentLink>();
        for(ContentDocumentLink link:[select Id,LinkedEntityId,ContentDocumentId from ContentDocumnetLink
                                      where ContentDocumentId IN: contentDocumentId]){
                                          //Checking the objecType is same or if the same Id of the object is same or not
                                          if(link.LinkedEntityId.getSObjectType()==Event__c.sObjectType
                                            || link.LinkedEntityId.getSObjectType()==Speaker__c.sObjectType
                                             || link.LinkedEntityId.getSObjectType()==Event_Organizer__c.sObjectType){
                                                 
                                                 contentDocumentLinkMap.put(link.contentDocumentId,link);
                                             }
                                      }
        return contentDocumentLinkMap;
    }

}
*/

public class contentVersionTriggerHandler {
    
    //Here we are preparing the format of the images in a set
    public static Set<String> fileType=new Set<String>{'jpg','png','jpeg','svg','jfif'};
    
    //In this method it is accepting two parameter one is list and another one is map
    public static void createPublicLinkFile(List<ContentVersion> contentVersionList,Map<Id,ContentVersion> contentVersionMap){
        
        //Here we have created one more method i.e getcontentDocumentLinkMap
        Map<Id,ContentDocumentLink> contentDocumentLinkMap=getcontentDocumentLinkMap(contentVersionList);
        List<ContentDistribution> distributionInsert=new List<ContentDistribution>();
        
        for(ContentVersion version : contentVersionList) {  // Fixed variable name and added missing closing parenthesis
            ContentDocumentLink link=contentDocumentLinkMap.get(version.Id);  // Fixed getting ContentDocumentLink by Id
            if((link.LinkedEntityId.getSObjectType() == Event__c.sObjectType ||
                link.LinkedEntityId.getSObjectType() == Speaker__c.sObjectType ||
                link.LinkedEntityId.getSObjectType() == Event_Organizer__c.sObjectType)
               && fileType.contains(version.FileType.toLowerCase())) {
                  distributionInsert.add(prepareContentDistribution(version.Id,version.Title));
            }
        }
        
        if(distributionInsert.size() > 0){
            insert distributionInsert;
        }
        List<ContentDistribution> distributionList=[select Id,ContentVersionId,ContentDownloadUrl,DistributionPublicUrl
                                                   from ContentDistribution
                                                   where Id IN: distributionInsert];
        List<Event__c> eventListUpdate=new List<Event__c>();
        List<Speaker__c> speakerListUpdate=new List<Speaker__c>();
        List<Event_Organizer__c> organizerListUpdate=new List<Event_Organizer__c>();
        for(ContentDistribution cd:distributionList){
            ContentVersion version=contentVersionMap.get(cd.ContentVersionId);
            ContentDocumentLink link=contentDocumentLinkMap.get(version.ContentDocumentId);
            String picUrl='';
            picUrl=cd.ContentDownloadUrl.replace('download/?','renditionDownload?rendition=ORIGINAL_Jpg&');
            picUrl=picUrl.replace('&ids', '&versionId');
            
            if(link!=null && link.LinkedEntityId.getSObjectType()==Event__c.sObjectType){
                Event__c eventrecord=new Event__c();
                eventRecord.Id=link.LinkedEntityId;
                eventRecord.title_image_url__c=picUrl;
                eventListUpdate.add(eventRecord);
            }
            else if(link!=null && link.LinkedEntityId.getSObjectType()==Speaker__c.sObjectType){
                Speaker__c speaker=new Speaker__c();
                speaker.Id=link.LinkedEntityId;
                speaker.Picture__c=picUrl;
                speakerListUpdate.add(speaker);
            }
            else if(link!=null && link.LinkedEntityId.getSObjectType()==Event_Organizer__c.sObjectType){
                Event_Organizer__c eventOrg=new Event_Organizer__c();
                eventOrg.Id=link.LinkedEntityId;
                eventOrg.Picture__c=picUrl;
                organizerListUpdate.add(eventOrg);
        }
    }
       /* update eventListUpdate;
        update speakerListUpdate;
        update organizerListUpdate;
*/
        
        List<sObject> allObjectUpdate=new List<sObject>();
        allObjectUpdate.addAll(eventListUpdate);
         allObjectUpdate.addAll(speakerListUpdate);
        allObjectUpdate.addAll(organizerListUpdate);
        
        
         
    }
    
    public static ContentDistribution prepareContentDistribution(Id contentVersionId,String title){
        ContentDistribution newDist=new ContentDistribution();
        newDist.ContentVersionId=contentVersionId;  // Fixed capitalization of field name
        newDist.Name=title;
        newDist.PreferencesNotifyOnVisit=false;
        newDist.PreferencesAllowOriginalDownload=true;
        return newDist;
    }
    
    public static Map<Id,ContentDocumentLink> getcontentDocumentLinkMap(List<ContentVersion> contentVersionList){
        
        Set<Id> contentDocumentId=new Set<Id>();  // Fixed the data type of Set
        
        for(ContentVersion version : contentVersionList){
            contentDocumentId.add(version.ContentDocumentId);
        }
        
        //Creating a map for the contentMapDocument Link
        Map<Id,ContentDocumentLink> contentDocumentLinkMap=new Map<Id,ContentDocumentLink>();
        for(ContentDocumentLink link : [SELECT Id, LinkedEntityId, ContentDocumentId FROM ContentDocumentLink WHERE ContentDocumentId IN :contentDocumentId]){
            //Checking the objecType is same or if the same Id of the object is same or not
            if(link.LinkedEntityId.getSObjectType() == Event__c.sObjectType ||
               link.LinkedEntityId.getSObjectType() == Speaker__c.sObjectType ||
               link.LinkedEntityId.getSObjectType() == Event_Organizer__c.sObjectType){
               contentDocumentLinkMap.put(link.ContentDocumentId, link);  // Fixed capitalization of field name
            }
        }
        return contentDocumentLinkMap;
    }
}