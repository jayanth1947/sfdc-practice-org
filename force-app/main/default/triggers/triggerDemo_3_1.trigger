trigger triggerDemo_3_1 on Opportunity (before update) {
    
    //Trigger.old
    
    for(Opportunity oldOpp:Trigger.old){
        for(Opportunity newOpp:Trigger.new){
            if(oldOpp.id==newOpp.id && oldOpp.Amount!=newOpp.Amount){ //Amount is equal in both opp and account
                //This will throw an error at the UI
                //This will give error at the UI
                //newOpp.addError('Amount can not be changed');
                
                
                //This will give error at the particular field
          
                newOpp.Amount.addError('Amount can not be changed');
                
                
            }
        }
    }
}