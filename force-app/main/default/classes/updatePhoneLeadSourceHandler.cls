public class updatePhoneLeadSourceHandler {
    
    public static void updatePhoneLeadSource(List<Account> newAccList, Map<Id,Account> oldAccMap){
        
        List<Id> sendThisList =new List<Id>();
        for(Account acc:newAccList){
            if(acc.Industry != oldAccMap.get(acc.Id).Industry && acc.Industry=='Biotechnology'){
                sendThisList.add(acc.Id);
            }
        }
        
        if(!sendThisList.isEmpty()){
            callAsycApex(sendThisList); 
        } 
    }
    
    @future
    public static void callAsycApex(List<Id> accIds){
        
        List<Contact> updateConList=new List<Contact>();
        List<Contact> conList=[SELECT Id,LeadSource,AccountId FROM Contact WHERE AccountId IN: accIds];
        
        for(Contact con:conList){
            con.LeadSource='Phone';
            updateConList.add(con);
        }
        
        if(!updateConList.isEmpty()){
            update updateConList;
        }
    }
}