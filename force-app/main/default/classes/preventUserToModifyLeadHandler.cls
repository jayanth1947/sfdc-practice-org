public class preventUserToModifyLeadHandler {

    public static void checkCreationDateBeforeUpdate(List<Lead> oldLeadList){
        
        for(Lead lea:oldLeadList){
            if(lea.CreatedDate <System.today() - 8){
                lea.addError('You Can not Modify this record');
            }
        }
    }
}