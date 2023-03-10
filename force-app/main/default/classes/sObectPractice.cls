public class sObectPractice {
    public static void newMethod(){
        //Standard sObject for account
        Account acc=new Account();
        //Standard sObject for Contact
        Contact con=new Contact();
        
        //Using Constructor for assigning the values
         Account acc1=new Account(Name='Higher Account');
                
        //Assigning the values to the sObjects
        //Using dot Notatition
        acc.Name='New Account';
        acc.AnnualRevenue=30000;
        
        con.FirstName='Javid';
        con.LastName='Bhai';
        
        //Generic sObjects
        sObject acc2=new Account(Name='General Account');
        sObject con1=new Contact();
        
        //In Generic sObjects Dot notation is not accesseble
        //put('FieldName','Value')
        acc2.put('Name','New General Accounts');
        //get('Field name')
        Object name=acc2.get('Name');
        
         
    }
}