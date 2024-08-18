public class caseUserHandler {
	public static void assignCases(String criteria, Id userId) {
        List<Case> casesToAssign = [SELECT Id, Subject,Status, OwnerId FROM Case WHERE Status=:criteria];
        for (Case c : casesToAssign) {
            c.OwnerId = userId;
        }
        update casesToAssign;
    }
}