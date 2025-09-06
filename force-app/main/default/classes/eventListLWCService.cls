public with sharing class eventListLWCService {

    // for eventListTwo cmp -parent child-eventTile
    // for upcoming Events
    /* The cacheable attribute in the annotation allows the method to be cached
     on the client-side to improve performance. When cacheable=true, the server 
     response for the method is cached on the client-side so that subsequent requests 
     for the same data from the same component can be served from the cache instead of making a new server call.*/
    @AuraEnabled(cacheable=true)

    // This method is for upcoming events
    public static List<Event__c> upcomingEvents(){

        List<Event__c> eventList =new List<Event__c>(); 
        try {

            eventList=[SELECT  Id,Location__c,title_image_url__c,
            Location__r.Name,Name__c,Start_DateTime__c
            FROM Event__c
            WHERE Start_DateTime__c>=TODAY AND Live__c=true
            WITH SECURITY_ENFORCED];
            
        }
        //This will catch the errors that are thrown by the try block 
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return eventList;
    }

    // For Past Events
    @AuraEnabled(cacheable=true)
    // This method is for past events
    public static List<Event__c> pastEvents(){
        List<Event__c> eventList =new List<Event__c>();
        try {

            eventList=[SELECT  Id,Location__c,title_image_url__c,
            Location__r.Name,Name__c,Start_DateTime__c
            FROM Event__c
            WHERE Start_DateTime__c <= TODAY
            WITH SECURITY_ENFORCED];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return eventList;
    }
}