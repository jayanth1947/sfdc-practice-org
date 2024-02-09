public class checkContactMailingState {

    public static Boolean checkMailingState(List<Contact> conList, String state){
        
        for(Contact con:conList){
            if(con.MailingState==state){
                return true;
            }
        }
        return false;
    }
}