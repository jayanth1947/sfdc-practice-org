public class ContactDeactivator {
    
    public static Integer updateContacts(){
        
        List<Contact> conList=[SELECT Id,LastName,active__c FROM Contact WHERE active__c=true];
        
        Integer count=0;
        for(Contact con:conList){
            con.active__c=false;
            count++;
            System.debug(con.LastName); 
        }
        System.debug(count);
        return count;
    }
}