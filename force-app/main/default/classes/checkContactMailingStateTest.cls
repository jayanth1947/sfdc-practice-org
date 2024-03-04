@isTest
public class checkContactMailingStateTest {
    
    @isTest()
    static void checkContactMail(){
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Hari '+i;
            con.MailingState='Telangana';
            conList.add(con);
        }
        insert conList;
        String state='Telangana';
        Boolean res=checkContactMailingState.checkMailingState(conList,state);
        
        for(Contact con:conList){
            System.assertEquals(state,con.MailingState);
        } 
        System.assertNotEquals(null, res, 'Result should not be null');
        System.assertEquals(true, res, 'Result should be true when all contacts have the expected MailingState');
    }
}