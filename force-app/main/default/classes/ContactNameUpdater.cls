public class ContactNameUpdater {
    
    public static void updateContactNames(String lastName,String firstName){
        
        List<Contact> conList=[SELECT Id,FirstName,LastName FROM Contact WHERE LastName=:lastName];
        List<Contact> newConList=new List<Contact>();
        for(Contact con:conList){
            con.FirstName=firstName;
            newConList.add(con);
        }
        
        try{
            if(!newConList.isEmpty()){
                update newConList;
            }
        }
        catch(DmlException e){
            System.debug('Error While updating');
        }
        System.debug(conList);
    }
}