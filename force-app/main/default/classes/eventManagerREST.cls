@RESTResource(urlMapping='/v1/Event')
global with sharing class eventManagerREST {

    @httpGet
    global static List<Event__c> upcomingEvents() {

        List<Event__c> eventList=[SELECT Id, Name, Event_Organizer__c,
        Event_Organizer__r.Name,Event_Organizer__r.Email__c,Location__r.Name,Location__r.Street__c,Location__r.City__c
        ,Location__r.Postal_Code__c,Location__r.Country__c,Location__r.State__c, End_Date_Time__c, 
        Event_Detail__c, Frequency__c, Event_Type__c, Live__c,
         Location__c, Max_Seats__c, Recurring__c, Name__c, Start_DateTime__c,
          Status__c, Location_Verified__c, Remaining_Seats__c, PeopleAttending__c 
          FROM Event__c where Start_DateTime__c>=Today AND Live__c=true WITH SECURITY_ENFORCED];
        return eventList;
    }
    
}