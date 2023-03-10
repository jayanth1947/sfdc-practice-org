public class contactListController {
        @AuraEnabled
        public static List<Contact> getContacts(Id recordId) {

            return [select Id,FirstName,LastName,Phone,Email
            from Contact where AccountId=:recordId]; 
            
        }
    }