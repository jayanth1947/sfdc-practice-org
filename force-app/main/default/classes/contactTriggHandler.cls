public class contactTriggHandler {
    public static void updateEmailField(List<Contact> conList){
        
        List<Contact> newConList=new List<Contact>();
        
        for(Contact con:conList){
            if(con.Email==null){
                con.Email='salesforcetrigger@developer.com';
            }
        }
        if(!newConList.isEmpty()){
            update newConList;
        }
    }
}