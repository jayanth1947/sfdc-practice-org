@isTest
public class updateContactPhoneTest {

    @isTest
    static void updatePhone(){
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.LastName='New Contact '+i;
            con.Phone='8902121112';
            conList.add(con);
        }
        insert conList;
        
        Test.startTest();
        String newPhone='8922101231';
        updateContactPhone.updateContacts(conList,newPhone);
        List<Contact> newConList=[SELECT Id,LastName,Phone FROM Contact];
        Integer count=0;
        
        for(Contact con:newConList){
            if(con.Phone!=null){
                System.assertEquals(newPhone,con.Phone);
            }
            count++;
        }
        System.debug(count);
        Test.stopTest();
        System.assertEquals(5,conList.size());
        
    }
}