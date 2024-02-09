public class updateAccountAnnualRevenue {
    public static void updateAnnualRevenue(List<Account> accList){
        
        for(Account acc:accList){
            if(acc.Industry=='Agriculture'){
                acc.AnnualRevenue=200000;
            }
            if(acc.Industry=='Banking'){
                acc.AnnualRevenue=600000;
            }
            if(acc.Industry=='Chemicals'){
                acc.AnnualRevenue=800000;
            }
            if(acc.Industry=='Insurance'){
                acc.AnnualRevenue=900000;
            }
        }
        
    }
}