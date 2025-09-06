public with sharing class delContact {
    
        public static void deleteContacts(List<Contact> conList) {
            List<Contact> contactsToDelete = [SELECT Id, AccountId FROM Contact WHERE AccountId = null];
     
            for(Contact contact : contactsToDelete) {
                if(contact.AccountId == null) {
                    // Delete the contact
                    delete contact;
                } else {
                    // Add error message for contacts linked to an account
                    contact.addError('Contact with Id ' + contact.Id + ' is linked to an account and cannot be deleted.');
                }
            }
    }
    }