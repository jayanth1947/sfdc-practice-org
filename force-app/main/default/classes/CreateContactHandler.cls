public class CreateContactHandler {

    public static void createContacts(List<Account> accList){
        
        List<Contact> newConList=new List<Contact>();
        
        for(Account acc:accList){
            if(acc.Create_N_Contacts__c!=null){
                for(Integer i=0;i<=acc.Create_N_Contacts__c;i++){
                    Contact con=new Contact();
                    con.LastName=acc.Name + i;
                    con.AccountId=acc.Id;
                    newConList.add(con);
                }
            }
        }
        
        if(!newConList.isEmpty()){
            insert newConList;
        }
    }
}