public class CaseCommentHandler {
    public static Map<Id, Integer> countCaseComments() {
        // Create a Map to store the count of comments for each Case
        Map<Id, Integer> caseCommentCount = new Map<Id, Integer>();
        // Get all CaseComment records
        for (CaseComment comment : [SELECT ParentId FROM CaseComment]) {
            // Get the Case Id from the comment
            Id caseId = comment.ParentId;
            // If the Case Id is already in the Map, increment the count
            if (caseCommentCount.containsKey(caseId)) {
                caseCommentCount.put(caseId, caseCommentCount.get(caseId) + 1);
            } 
            // If the Case Id is not in the Map, add it with a count of 1
            else {
                caseCommentCount.put(caseId, 1);
            }
        }
        // Return the Map of Case Ids and comment counts
        System.debug(caseCommentCount);
        return caseCommentCount;
       
    }
}