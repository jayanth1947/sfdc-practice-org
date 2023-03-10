public with sharing class eventListController {
    //whenever wire is used we need to include this parameter cacheable=true inside this annotation
    @AuraEnabled
    public static List<Event__c> upcomingEvents(){

        //fetch the details of the event
        List<Event__c> eventList=[select Id,Name,Name__c,
        Event_Detail__c,Location__c,Location__r.Name,
        Event_Organizer__c,Start_DateTime__c,Event_Organizer__r.Name
        from Event__c where Start_DateTime__c>=Today AND Live__c=true WITH SECURITY_ENFORCED];

        return eventList;
        
    }
}