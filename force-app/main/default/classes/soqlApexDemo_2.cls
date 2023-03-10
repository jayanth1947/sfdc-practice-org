public class soqlApexDemo_2 {
    public static void mymethod(){
        
        //Realtionship queries
        
        //1.child to parent 
        //Note: Here Account is the parent object's reference which is relationship fields name on child object
         
        List<Contact> con=[select firstName,lastName,Account.Name,Account.AnnualRevenue from Contact];
        
        
        //For Custom Objects
        //Note: For custom relationships we will use '__r' for the parent fields Name
        List<Airplane__c> arr=[select Airline_id__c,Name,Boarding_Pass__r.Name,Boarding_Pass__r.contact_number__c from Airplane__c];
        
        
        //Parent -to- child Relation
        /*
         *Here we will write the sub query for fetching the child records from the parent
         --In the sub-query we will write the child name as the 'childrelationship Name' In the Detail side
 		*/
        
        //Eg-1
        List<Account> acclist=[select Name, AnnualRevenue ,(select firstName,lastName from Contacts) from Account];
        
        //Eg-2
        List<Account> acclist1=[select Name, AnnualRevenue,(select Amount,LeadSource from Opportunities) from Account];
        
        
        //for custom objects
        
        /*These can be used to fetch in any relation
        In the inner query we use the childrelationship name and '__r' for custom relation
		*/
        
        //Eg-1
        List<Flight__c> fli=[select Name,flight_id__c,from__c,to__c,(select Flight_id__c,Name,fare__c from Tickets__r) from Flight__c];
        
        
        
        //Eg-2
        
        List<Passenger__c> pass=[select Name,passenger_id__c,Meal__c, (select Name,Passenger_id__c,contact_number__c,gate__c from Boarding_Passs__r) from Passenger__c];
        
        //Eg-3
        
        List<Airline__c> air=[select airline_id__c,Name,(select Name,modelnumber__c from Airplanes__r) from Airline__c];
        
        
        
        //Multi level relationship
        //Child -to-parent relationship
        //This will return the child to parent records.
        List<OpportunityLineItem> oppo=[select Name,TotalPrice,Opportunity.Name,Opportunity.Type,Opportunity.Account.Name,Opportunity.Account.AnnualRevenue from OpportunityLineItem];
        
        
        //For custom Objects
        //Here we use '__r' for a custom relationship of the field name.
        List<Airplane__c> arr1=[select areoplane_id__c,Name,Boarding_Pass__r.Name,Boarding_Pass__r.meal__c,Boarding_Pass__r.Flight_id__r.Name,Boarding_Pass__r.Flight_id__r.from__c,Boarding_Pass__r.Flight_id__r.to__c from Airplane__c];
        
        
    }
}