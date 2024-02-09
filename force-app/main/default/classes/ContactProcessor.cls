public class ContactProcessor {
    public static void updateEmailAddress(String lastName, String email){
        
        List<Contact> conList =[SELECT Id, FirstName,LastName FROM Contact WHERE LastName=:lastName];
        
        for(Contact con:conList){
            con.Email=email;
            System.debug(con.Email);
        }
    }
}