trigger triggerDemo_2 on Account (before insert) {
    
    //Context variables
    
    //1. Trigger.new
    
    //List<Account> acc=[select Name,	AnnualRevenue from Account];
    
    //This will update when you will insert a account
    
    for(Account a:Trigger.new){
        a.AnnualRevenue=1200;
    }

}