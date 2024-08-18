public class CaseAssigner {

    public static Integer assignCasesToQueues() {
        Integer assignedCasesCount = 0;

        // Query for open cases
        List<Case> openCases = [SELECT Id, Subject, Description, Priority FROM Case WHERE Status = 'New'];

        // Define assignment logic based on predefined criteria
        for (Case c : openCases) {
            if (c.Subject!=null) {
                c.QueueId__c = 'HighPriorityQueueId';
            } 
             else {
                c.QueueId__c = 'DefaultQueueId';
            }
            assignedCasesCount++;
        }

        // Update the cases
        update openCases;
		System.debug('Count of Cases '+assignedCasesCount);
        return assignedCasesCount;
    }
}