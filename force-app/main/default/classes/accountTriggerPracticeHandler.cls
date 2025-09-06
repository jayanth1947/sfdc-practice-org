public with sharing class accountTriggerPracticeHandler {

    //Account Trigger to set Account Rating as 'Hot' if Account Industry is Banking or Health Care
    public static void updateRating(List<Account> accList) {
        
        for (Account acc : accList) {
            if (acc.Industry=='Banking' || acc.Industry=='Healthcare') {
                acc.Rating='Hot';
            }
        }
    }


    // Assign AnnualRevenue based on the Account Industry
    public static void assignAnnualRevenue(List<Account> accList) {
        
        for (Account acc : accList) {
            if (acc.Industry=='Media') {
                acc.AnnualRevenue=20000;
            }
            else if(acc.Industry=='Banking') {
                acc.AnnualRevenue=30000;
            }
            else if(acc.Industry=='Education') {
                acc.AnnualRevenue=40000;
            }
            else if(acc.Industry=='Healthcare') {
                acc.AnnualRevenue=50000;
            }
            else{
                acc.AnnualRevenue=10000;
            }
        }
    }

    public static void preventAccountDelete(List<Account> accList) {
        
        for (Account acc : accList) {
            if (acc.Active__c=='Yes') {
                acc.addError('Account Can not be deleted');
            }
        }
    }

    //Prevent Duplication of Account Records 
    public static void preventDuplication(List<Account> accList) {
        for (Account acc : accList) {
            Integer recordCount=[SELECT count() FROM Account WHERE Name =:acc.Name];
            if (recordCount>0) {
                acc.addError('Duplicate Records Found');
            }
        }
    }


    //This method will be used when an account is deleted the related childs will not be deleted
    public static void deleteAccount(Map<Id, Account> oldMap) {
        List<Contact> conList = [
            SELECT Id, AccountId
            FROM Contact
            WHERE AccountId IN :oldMap.keySet()
        ];

        if (!conList.isEmpty()) {
            for (Contact con : conList) {
                con.AccountId = null;
            }
        }

        update conList;
    }

    //Copy of Account Phone and Fax Fields to Contact Phone and Fax Fields
    public static void copyAccountPhoneToRelaContacts(List<Account> accList,Map<Id,Account> oldAccMap) {
        
        List<Contact> contactsToUpdate = new List<Contact>();

        for (Account updatedAccount : accList) {
            Account oldAccount = oldAccMap.get(updatedAccount.Id);

            // Check if the Phone or Fax fields have been changed
            if (updatedAccount.Phone != oldAccount.Phone || updatedAccount.Fax != oldAccount.Fax) {
                // Query related Contacts
                List<Contact> relatedContacts = [SELECT Id FROM Contact WHERE AccountId = :updatedAccount.Id];

                // Update Phone and Fax on related Contacts
                for (Contact contactToUpdate : relatedContacts) {
                    contactToUpdate.Phone = updatedAccount.Phone;
                    contactToUpdate.Fax = updatedAccount.Fax;
                    contactsToUpdate.add(contactToUpdate);
                }
            }
        }

        // Update the Contacts in bulk
        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }
    }

    public static void updateRatingBasedOnIndustry(List<Account> accList) {
        
        for (Account acc : accList) {
            if (acc.Industry!=null && acc.Industry =='Insurance') {
                acc.Rating='Hot';
            }
        }
    }


    public static void copyBillingToShipping(List<Account> accList) {
        
        for (Account acc : accList) {
            
            if (acc.CopyBillingToShipping__c) {
                
                acc.ShippingStreet=acc.BillingStreet;
                acc.ShippingCity=acc.BillingCity;
                acc.ShippingState=acc.BillingState;
                acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
        }
        
       
    }

    //Created Related Contact On Account Creation
    public static void createContact(List<Account> accList) {
        List<Contact> conList = new List<Contact>();

        for (Account acc : accList) {
            Contact con=New Contact();
            con.FirstName='Trigger';
            con.LastName=acc.Name;
            con.AccountId=acc.Id;
            con.Email='trigger@gmail.com';
            con.Phone='9702312224';
            conList.add(con);
        }

        if (!conList.isEmpty()) {
            insert conList;
        }     
    }

    public static void createOpportunity(List<Account> accList) {
        
        List<Opportunity> oppList = new List<Opportunity>();

        for (Account acc : accList) {
            Opportunity opp=new Opportunity();
            opp.Name=acc.Name;
            opp.CloseDate=System.today();
            opp.StageName='Prospecting';
            opp.AccountId=acc.Id;
            oppList.add(opp);
        }
        if (!oppList.isEmpty()) {
            insert oppList;
        }
    }


    public static void createContactAndOpportunity(List<Account> accList) {
        
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        for (Account acc : accList) {
            if (acc.New_Contact__c) {
                Contact con=new Contact();
                con.FirstName='Trigger '+acc.Name;
                con.LastName='Last Trigger';
                con.AccountId=acc.Id;
                con.Phone='980212221';
                con.Email='kiran@gmail.com';
                conList.add(con);
            }

            if(acc.New_Opportunity__c && acc.Active__c=='Yes'){
                    Opportunity opp=new Opportunity();
                    opp.Name=acc.Name;
                    opp.CloseDate=System.today();
                    opp.StageName='Prospecting';
                    opp.AccountId=acc.Id;
                    oppList.add(opp);   
                
            }
        }

        if (!conList.isEmpty()) {
            insert conList;
        }
        if (!oppList.isEmpty()) {
            insert oppList;
        }
        
    }

    //update description based on Phone Value Change
    public static void updateDescription(List<Account> accList,Map<Id,Account> oldAccMap) {
        
        for (Account acc : accList) {
            if (acc.Phone!=null && acc.Phone!=oldAccMap.get(acc.Id).Phone) {
                acc.Description='Phone is Updated! Old Value: '+oldAccMap.get(acc.Id).Phone
                                + ' New Value: '+acc.Phone;

            }
        }
    }

    public static void updateRelatedOpportunity(List<Account> accList,Map<Id,Account> oldAccMap) {
        List<Opportunity> oppList = new List<Opportunity>();

        Set<Id> accIds = new Set<Id>();
        for (Account acc : accList) {
            if (acc.Active__c=='No' && acc.Active__c!=oldAccMap.get(acc.Id).Active__c) {
                accIds.add(acc.Id);
            }
        }

        for (Account acc : [SELECT Id,Active__c ,(SELECT Id,StageName FROM Opportunities) FROM Account WHERE Id in :accIds]) {
            if (acc.Opportunities!=null) {
                for (Opportunity opp : acc.Opportunities) {
                    if (opp.StageName!='Closed Won' && opp.StageName!='Closed Lost') {
                        opp.StageName='Closed Lost';
                        oppList.add(opp);
                    }
                }
            }
        }

        if (!oppList.isEmpty()) {
            update oppList;
        }
    }

    public static void preventAccountDeletecDiffProfile(List<Account> accList) {
        
        Profile pro=[SELECT Id,Name FROM Profile WHERE Name='System Administrator'];
        for (Account acc : accList) {
            if (UserInfo.getProfileId()!=pro.Id) {
                acc.addError('You dont have permission to delete an Account. Please Contact System Administrator.');
            }
        }
    }

    public static void preventDeleteAccountRelOppo(List<Account> accList,Map<Id,Account> oldAccMap) {
        
        Set<Id> accIds = new Set<Id>();
        for (Account acc : accList) {
            accIds.add(acc.Id);
        }

        for (Account acc : [SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN:accIds]) {
            if (acc.Opportunities.size()>0) {
                Account accToDelte=oldAccMap.get(acc.Id);
                accToDelte.addError('You can not delete an Account which are related to Opportunities');
            }
        }
    }


    public static void preventDeleteAccountRelCases(List<Account> accList,Map<Id,Account> oldAccMap) {
        
        Set<Id> accIds = new Set<Id>();
        for (Account acc : accList) {
            accIds.add(acc.Id);
        }

        for (Account acc : [SELECT Id, (SELECT Id FROM Cases) FROM Account WHERE Id IN:accIds]) {
            if (acc.Cases.size()>0) {
                Account accToDelte=oldAccMap.get(acc.Id);
                accToDelte.addError('You can not delete an Account which are related to Cases');
            }
        }
    }
}