@isTest
public class ContactDeleterTest {

    @isTest
    static void deleteContact(){
        
        Contact con=new Contact(LastName='Hima',Email='hima@gmail.com');
        insert con;
        Test.startTest();
        ContactDeleter.deleteContacts('hima@gmail.com');
        Test.stopTest();
        List<Contact> deletedContacts = [SELECT Id FROM Contact WHERE Email = 'hima@gmail.com'];
        System.assertEquals(0, deletedContacts.size(), 'Contact should have been deleted.');
    }
}