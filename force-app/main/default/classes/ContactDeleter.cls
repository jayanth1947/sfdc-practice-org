public class ContactDeleter {

    public static void deleteContacts(String emailAddress){
        
        List<Contact> conList=[SELECT Id,Name,Email FROM Contact WHERE Email=:emailAddress];
        
        if(!conList.isEmpty()){
            delete conList;
        }
    }
}