public class DuplicateContactHandler {

    public static void checkDuplicateContacts(List<Contact> newConList){
        
        List<Contact> existingConList=[SELECT Id,LastName,Email,Phone FROM Contact];
        for(Contact con:newConList){
            for(Contact exeCon:existingConList){
                if(con.LastName ==exeCon.LastName &&con.Email ==exeCon.Email && con.Phone ==exeCon.Phone){
                    con.addError('Duplicates Found');
                }
            }
        }
    }
}