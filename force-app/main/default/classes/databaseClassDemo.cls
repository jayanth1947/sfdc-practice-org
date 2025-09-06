public class databaseClassDemo {
    public static void demoInsert(){
        List <Contact> contactLst=new List<Contact>{new Contact(FirstName='Ravi',LastName='Kiran'),
            new Contact (FirstName='Ram',LastName='Kumar'),
            new Contact()};
                Database.SaveResult[] res=Database.insert(contactLst,false);
    }
    
}