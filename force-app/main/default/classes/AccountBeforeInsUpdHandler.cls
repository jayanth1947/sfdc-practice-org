public class AccountBeforeInsUpdHandler {

     public static void updateRating(List<Account> accList,Map<Id,Account> oldAccMap){
        
        for(Account acc:accList){
            
            if((oldAccMap==null && acc.Industry!=null && acc.Industry=='Media')
               ||(acc.Industry!=null && 
                  acc.Industry=='Media' && acc.Industry!=oldAccMap.get(acc.Id).Industry)){
                acc.Rating='Hot';
            }
        }
    }
    
   
}