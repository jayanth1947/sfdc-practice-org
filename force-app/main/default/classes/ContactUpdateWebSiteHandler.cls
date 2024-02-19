public class ContactUpdateWebSiteHandler {

    public static void updateWebsiteOnContacts(List<Account> newAccList,Map<Id,Account> oldAccMap){
        
        Map<Id,String> newWebSiteMap=new Map<Id,String>();
        
        for(Account acc:newAccList){
            newWebSiteMap.put(acc.Id,acc.Website);
        }
        
        if(newWebSiteMap.keySet().size()>0){
            List<Contact> conToUpdate=new List<Contact>();
            List<Contact> conRecords=[SELECT Id,Name,Website__c,AccountId FROM Contact WHERE AccountId IN: newWebSiteMap.keySet()];
            
            for(Contact con:conRecords){
                con.Website__c=newWebSiteMap.get(con.AccountId);
                conToUpdate.add(con);
            }
            
            if(!conToUpdate.isEmpty()){
                update conToUpdate;
            }
        }
    }
}