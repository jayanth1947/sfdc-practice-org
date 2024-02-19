public class AccountOwnerShipPreventionHandler {

    public static void preventOwnerShip(List<Account> newAccList ,Map<Id,Account> oldAccMap){
        
        for(Account acc:newAccList){
            if(acc.Industry=='Agriculture' && acc.Type=='Prospect'){
                if(oldAccMap.get(acc.Id).Ownership !=acc.Ownership && acc.Ownership=='Private'){
                    acc.addError('OwnerShip Cannot be Modified');
                }
            }
        }
    }
}