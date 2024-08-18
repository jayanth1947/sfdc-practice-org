public class preventAdditionOfNewContactRecordsHan {

    public static void preventAddContactRecords(List<Contact> newConList){
        
        List<Id> accountIds=new List<Id>();
        Map<Id,Id> accountConMap=new Map<Id,Id>();
        
        for(Contact con:newConList){
            //The Ids of Account are stored in a list and Map
			accountIds.add(con.AccountId);
            accountConMap.put(con.Id,con.AccountId);
        }
        
        //Retriving the accounts and its child contacts and stored it in a map
        Map<Id,Account> accMap=new Map<Id,Account>([SELECT Id,Max_Contacts_Allowed__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN:accountIds]);
        
        //Looping over the Account Ids
        for(Id accIds:accMap.keySet()){
            //Getting the size of contacts that are related to the account and storing it an variable
            Integer  NoOfContacts= (accMap.get(accIds).Contacts).size();
            
            //Checking if the size and max contacts allowed are greater than
            if(!(accMap.get(accIds).Max_Contacts_Allowed__c >= NoOfContacts)){
                
                //Looping over the new contact list
                for(Contact con:newConList){
                    //Checking if the account ids and the contact accountids are same or not.
                    if(con.AccountId ==accIds){
                        con.addError('Contact Insertion Not Allowed ');
                    }
                } 
            }
        }
    }
}