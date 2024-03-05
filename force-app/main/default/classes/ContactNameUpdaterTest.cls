@isTest
public class ContactNameUpdaterTest {
/*
    @isTest
    static void updateContactName(){
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.LastName='New Contact '+i;
            con.FirstName='first';
            conList.add(con);
        }
        insert conList;
        String lastName='New Contact';
        String firstName='Kiran';
        ContactNameUpdater.updateContactNames(lastName, firstName);
        
        List<Contact> updateConList=[SELECT Id,FirstName,LastName FROM Contact WHERE LastName=:lastName];
        List<Contact> newConList=new List<Contact>();
        for(Contact con:updateConList){
            con.FirstName=firstName;
            newConList.add(con);
        }
        if(!newConList.isEmpty()){
            update newConList;
        }
    } */
    
     @IsTest
    static void testUpdateContactNames() {
        // Create a test contact
        Contact testContact = new Contact(LastName = 'Doe');
        insert testContact;

        // Call the method to update contact names
        Test.startTest();
        ContactNameUpdater.updateContactNames('Doe', 'John');
        Test.stopTest();

        // Verify that the contact's first name has been updated
        Contact updatedContact = [SELECT Id, FirstName FROM Contact WHERE Id = :testContact.Id];
        System.assertEquals('John', updatedContact.FirstName, 'First name should match.');
    }

}