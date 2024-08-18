public class LeadConverter {
    public static void convertLead(List<Lead> leadList){
        List<Lead> leadRec=new List<Lead>();
        List<Account> accRec=new List<Account>();
        List<Contact> conRec=new List<Contact>();
        List<Opportunity> oppRec=new List<Opportunity>();
        for(Lead lea:leadList){
            Account acc=new Account();
            acc.Name=lea.Company;
			accRec.add(acc);
            
            Contact con=new Contact();
            con.FirstName=lea.FirstName;
            con.LastName=lea.LastName;
            conRec.add(con);
            
            Opportunity opp=new Opportunity();
            opp.Name=lea.Company;
            opp.StageName='Prospecting';
            opp.CloseDate=System.today();
            oppRec.add(opp);
        }
        if(!accRec.isEmpty()){
            insert accRec;
        }
        if(!conRec.isEmpty()){
            insert conRec;
        }
        if(!oppRec.isEmpty()){
            insert oppRec;
        }
    	
    }
    
}