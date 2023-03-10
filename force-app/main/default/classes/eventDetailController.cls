public with sharing class eventDetailController {

    // @AuraEnabled is must when you use the class inside the component
    @AuraEnabled
    
    public static List<EventSpeakers__c> getSpeaker(String eventId){

        // Get the speaker details 
        List<EventSpeakers__c> speakerList=[select Id,Name,Speaker__c,
        Speaker__r.Name,Speaker__r.Phone__c,Speaker__r.Email__c,
        Speaker__r.About_Me__c,Speaker__r.Picture__c,
        Speaker__r.Company__c from EventSpeakers__c where Event__c =:eventId WITH SECURITY_ENFORCED ];

        //Return the list
        return speakerList;
    }
    @AuraEnabled
    public static Event__c getLocation(String eventId){
        Event__c eventRec=[select Id,Name__c,
        Location__r.Name,Location__r.City__c,Location__r.Street__c,
        Location__r.Country__c,Location__r.Postal_Code__c
         from Event__c where Id=:eventId WITH SECURITY_ENFORCED];

         return eventRec;   
    }

    @AuraEnabled
    public static List<Event_Attendee__c> getEventAttendee(String eventId){
        List<Event_Attendee__c> eventAttendeeList = [
      SELECT
        Id,
        Name,
        Attendee__c,
        Attendee__r.Name,
        Attendee__r.Email__c,
        Attendee__r.Company_Name__c,
        Attendee__r.Location__c,
        Attendee__r.Location__r.Name
      FROM Event_Attendee__c
      WHERE Event__c = :eventId
      WITH SECURITY_ENFORCED
    ];
    return eventAttendeeList;
    }
}