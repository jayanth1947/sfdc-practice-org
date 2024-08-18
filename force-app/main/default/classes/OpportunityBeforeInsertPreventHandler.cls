public class OpportunityBeforeInsertPreventHandler {

    public static void preventUser(List<Opportunity> oppList){
        for(Opportunity opp:oppList){
            if(opp.Amount==null){
                opp.addError('Amount field can not be blank');
            }
        }
    }
}