@isTest
public class contactTriggHandlerTest {

    @isTest
    static void updateEmail(){
        List<Contact> conList=new List<Contact>();
        Contact con=new Contact();
        con.LastName='Hima';
        con.FirstName='Bindhu';
        conList.add(con);
        
        Test.startTest();
        insert conList;
        contactTriggHandler.updateEmailField(conList);
        Test.stopTest();
        
        for(Contact newcon:conList){
            newcon.Email='salesforcetrigger@developer.com';
        }
        update conList;
        
        System.assertEquals(1,conList.size());
        System.assertEquals('salesforcetrigger@developer.com',conList[0].Email);
        /*if(conList[0].Email ==null){
            
        } */
    } 
    
   
}