public class updateContactMailingCountry {
    
    public static Integer updateMailingCountry(List<Contact> conList){
        
        Integer count=0;
        for(Contact con:conList){
            if(con.MailingCountry==null){
                con.MailingCountry='India';
                count++;
            }
        }
        System.debug('Records updated '+count);
        System.debug(conList);
        return count;
    }
}