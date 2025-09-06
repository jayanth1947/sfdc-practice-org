public with sharing class eventDetailLWCServiceTwo {

    // This is for eventDetailCmpTwo cmp

    @AuraEnabled(cacheable=true)
    public static Event__c fetchEventDetails(String recordId){
        Event__c eventRecord=new Event__c();
        try {
            eventRecord =[SELECT  Id, Name, CreatedDate, Event_Organizer__c,
            Event_Organizer__r.Company__c,Event_Organizer__r.About_Speaker__c,
            Event_Organizer__r.Name,Event_Organizer__r.Email__c,Event_Organizer__r.OwnerId
            ,Location__r.Name,Location__r.Street__c,Location__r.City__c,
            Location__r.Postal_Code__c,Location__r.Country__c,
            Location__r.State__c,Name__c,End_Date_Time__c, Event_Detail__c, Event_Type__c, 
            Frequency__c, Live__c, Location__c, Max_Seats__c, Recurring__c, Start_DateTime__c, Status__c,
             Location_Verified__c, Remaining_Seats__c, PeopleAttending__c FROM Event__c
              WHERE Id=:recordId];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return eventRecord;
    }


    // For retriving the speakers records
    @AuraEnabled(cacheable=true)
    public static List<EventSpeakers__c> fetchSpeakerDetails(String eventId){
        List<EventSpeakers__c> speakers = new List<EventSpeakers__c>();
        try {
            speakers=[SELECT Id,Event__c,Speaker__c,Speaker__r.Name,
            Speaker__r.Company__c,Speaker__r.About_Me__c,Speaker__r.Picture__c
            from EventSpeakers__c WHERE Event__c=:eventId
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return speakers;
    }
}