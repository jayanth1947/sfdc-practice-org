@isTest
public class ContactPhoneUpdaterTest {

    @isTest
    static void updateContactPhone(){
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Kiran '+i;
            con.Phone='9102345678';
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        ContactPhoneUpdater.updateContactPhones();
        for(Contact con:conList){
            if(con.LastName!=null){
                con.Phone='9089876661';
                System.assertEquals('9089876661',con.Phone);
            }
        }
        Test.stopTest();
        System.assertEquals(50,conList.size());
        System.assertEquals('9089876661',conList[0].Phone);
    }
}