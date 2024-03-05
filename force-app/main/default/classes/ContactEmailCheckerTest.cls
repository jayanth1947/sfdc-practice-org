@isTest
public class ContactEmailCheckerTest {
    
    @isTest
    static Boolean checkEmailOnContact(){
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Kiran '+i;
            con.Email='kiran@gmail.com';
            con.active__c=true;
            conList.add(con);
        }
        Test.startTest();
        insert conList;
        String domainPattern='gmail';
        ContactEmailChecker.checkEmailDomains(conList, domainPattern);
        
        
        Pattern pattern = Pattern.compile(domainPattern);
        for (Contact contact : conList) {
            String emailDomain = contact.Email.substringAfter('@');
            Matcher matcher = pattern.matcher(emailDomain);
            if (matcher.matches()) {
                System.debug(matcher);
                return true;
            }
        }
        Test.stopTest();
        Assert.areEqual(50,conList.size());
        return false;
        
    }
}