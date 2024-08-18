public class updateContactPhone {

    public static Integer updateContacts(List<Contact> conList,String newPhoneNumber){
        Integer count=0;
        for(Contact con:conList){
            con.Phone=newPhoneNumber;
            count++; 
        }
        try{
            update conList;
        }
        catch(DmlException e){
            System.debug('Error updating contacts: ' + e.getMessage());
        }
        System.debug(count);
        return count;  
    }
}