public with sharing class contactTriggerPracticeHandler {
    
    //create an account record when a new contact is created
    public static void createAccount(List<Contact> conList) {
        
        List<Account> accList = new List<Account>();
        for (Contact con : conList) {
            if (con.AccountId==null) {
                Account acc=new Account();
                acc.Name='New Account';
                acc.Phone='899300221';
                accList.add(acc);
            }
            
        }
        if (!accList.isEmpty()) {
            insert accList;
        }
        
    }

    // Mandate Email and Phone on the Contact Record upon creating and updating 
    public static void mandateEmailAndPhone(List<Contact> conList) {
        
        for (Contact con : conList) {
            if(con.Email ==null && con.Phone ==null){
                con.addError('Email and Contact Should be mandate for creating Contact');
            }
        }
    }

    public static void contactAssignToAccount(List<Contact> conList) {
        
        for (Contact con : conList) {
            if (con.AccountId==null) {
                con.addError('It should be linked to one of the account');
            }
        }
    }
}