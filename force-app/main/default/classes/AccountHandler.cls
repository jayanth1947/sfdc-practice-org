public class AccountHandler {
    public static void createAccount(){
        List<Account> accRec=new List<Account>();
            Account newacc=new Account();
            newacc.Name='New Account Trigger';
            accRec.add(newacc);
       		insert accRec;
    }
    
    public static void createContact(List<Account> accList){
        
        List<Contact> newConList =new List<Contact>();
        
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName='New Account Contact Record';
            con.AccountId=acc.Id;
			newConList.add(con);
        }
        if(!newConList.isEmpty()){
            insert newConList;
        }
        
    }
}