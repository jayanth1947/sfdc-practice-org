public class ContactPreventionHandler {

    public static void preventUserForContact(List<Contact> conList){
        for(Contact con:conList){
            if(con.AccountId==null){
                con.addError('Account is Mandatory');
            }
        }
    }
}