// Whenever a Case is created and Case Origin is Phone. Set Priority as High , else set Priority as Low.
trigger CaseTrigger on Case (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        for(Case cas:Trigger.new){
            if(cas.Origin=='Phone'){
                cas.Priority='High';
            }
            else{
                cas.Priority='Low';
            }
        }
    }
}