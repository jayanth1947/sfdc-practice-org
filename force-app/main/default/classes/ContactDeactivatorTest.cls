@isTest
public class ContactDeactivatorTest {

    @isTest
    static void deactivateContact(){
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Kiran '+i;
            con.active__c=true;
            conList.add(con);
        }
        Test.startTest();
        insert conList;
        ContactDeactivator.updateContacts();
        List<Contact> conListToDeactivate=new List<Contact>();
        Integer count=0;
        for(Contact con:conList){
            con.active__c=false;
            count++;
            conListToDeactivate.add(con);
        }
        update conListToDeactivate;
        Test.stopTest();
        Assert.areEqual(50,conList.size());
        Assert.areEqual(50,count);
    }
}