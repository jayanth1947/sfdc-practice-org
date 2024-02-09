public class filteredContactHandler {

    public static List<Contact> filterContacts(List<Contact> conList){
        
        List<Contact> filterContactList=new List<Contact>();
        for(Contact con:conList){
            if(con.active__c == true){
                filterContactList.add(con);
                
            }
            
        }
        System.debug('New Contact List '+filterContactList);
        return filterContactList;
    }
}