public class AccountAfterInsertCheckBoxHandler {
    
    public static void createContactAndOpportunity(List<Account> accList){
        
        List<Contact> conList=new List<Contact>();
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Account acc:accList){
            if(acc.New_Contact__c){
                Contact con=new Contact();
                con.LastName=acc.Name;
                con.AccountId=acc.Id;
                conList.add(con);
            }
            if(acc.New_Opportunity__c){
                Opportunity opp=new Opportunity();
                opp.Name=acc.Name;
                opp.AccountId=acc.Id;
                opp.Amount=20000;
                opp.StageName='Prospecting';
                opp.CloseDate=system.today()+4;
                oppList.add(opp);
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
        if(!oppList.isEmpty()){
            insert oppList;
        }
    }
}