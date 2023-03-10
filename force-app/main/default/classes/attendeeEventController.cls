public with sharing class attendeeEventController {

    // One method is for upcoming events
    @AuraEnabled
    public static List<Event_Attendee__c> upcomingEvents( String eventId){

        // Fetch the data according to the query
        List<Event_Attendee__c> eventAttendeeList=[select Id,Name,
        Event__c,
        Event__r.Location__c,
        Event__r.Location__r.Name,
        Event__r.Event_Organizer__c,
        Event__r.Event_Organizer__r.Name,
        Event__r.Name__c,
        Event__r.Start_DateTime__c
         from Event_Attendee__c where Attendee__c=:eventId
         AND Event__r.Start_DateTime__c >=today
         AND Event__r.Live__c=true WITH SECURITY_ENFORCED ];
         return eventAttendeeList;
        
    }

    // This method is used for pastEvents
    @AuraEnabled
    public static List<Event_Attendee__c> pastEvents( String eventId){

        List<Event_Attendee__c> eventAttendeeList=[select Id,Name,
        Event__c,
        Event__r.Location__c,
        Event__r.Location__r.Name,
        Event__r.Event_Organizer__c,
        Event__r.Event_Organizer__r.Name,
        Event__r.Name__c,
        Event__r.Start_DateTime__c
         from Event_Attendee__c where Attendee__c=:eventId
         AND Event__r.Start_DateTime__c <today
         AND Event__r.Live__c=true WITH SECURITY_ENFORCED ];
         return eventAttendeeList;
        
    }
}