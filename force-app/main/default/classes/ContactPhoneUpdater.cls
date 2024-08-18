public class ContactPhoneUpdater {

    public static void updateContactPhones(){
        List<Contact> conList=[SELECT Id,Name,Phone FROM Contact];
        
        for(Contact con:conList){
            con.Phone='9089876661';
        }
        System.debug(conList);
    }
}