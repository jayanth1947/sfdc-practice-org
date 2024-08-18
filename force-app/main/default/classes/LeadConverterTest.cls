@isTest
public class LeadConverterTest {

    @isTest
    static void convertLead(){
        List<Lead> leadList=new List<Lead>();
        List<Account> accRec=new List<Account>();
        List<Contact> conRec=new List<Contact>();
        List<Opportunity> oppRec=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Lead lea=new Lead();
            lea.LastName='Lead '+i;
            lea.Company='New Company';
            lea.Status='Open - Not Contacted';
            leadList.add(lea);
        }
        for(Integer i=1;i<=5;i++){
            Account acc=new Account();
            acc.Name='Lead Account '+i;
			accRec.add(acc);
        }
            
            for(Integer i=1;i<=5;i++){
            Contact con=new Contact();
            con.FirstName='Lead FirstName';
            con.LastName='Lead LastName';
            conRec.add(con);
            }
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='Lead Opportunity';
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppRec.add(opp); 
        }
        
        Test.startTest();
        insert leadList;
        insert accRec;
        insert conRec;
        insert oppRec;
        LeadConverter.convertLead(leadList);
        Test.stopTest();
        System.assertEquals(4,leadList.size()-1);
        
    }
}