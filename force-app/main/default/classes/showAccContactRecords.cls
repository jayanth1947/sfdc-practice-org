public class showAccContactRecords {
    public static Integer relContacts(String ids){
        
        List<Contact> conList=[SELECT Id,Name,AccountId FROM Contact WHERE AccountId=:ids];
        if(!conList.isEmpty()){
            System.debug(conList);
        	System.debug('Total No of related Contacts ' +conList.size());
        }
        return conList.size();
    }
}