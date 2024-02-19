public class PreventLeadDeleteHandler {

    public static void preventLeadDelete(List<Lead> oldList){
        for(Lead lea:oldList){
            if(lea.Status=='Working-Contacted'){
                lea.addError('This Lead is Currently Working');
            }
        }
    }
}