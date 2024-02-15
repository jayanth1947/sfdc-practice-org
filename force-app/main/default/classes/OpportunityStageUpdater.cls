public class OpportunityStageUpdater {

    public static void updateOpportunityStages() {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();
        // Query opportunities with closed date in the past
        Date today = Date.today();
        System.debug('Querying opportunities with close date before ' + today);
        for (Opportunity opp : [SELECT Id, StageName FROM Opportunity WHERE CloseDate < :today]) {
            System.debug('Found opportunity: ' + opp.Id + ', Stage: ' + opp.StageName);
            // Update stage based on your specific logic
            opp.StageName = 'Closed Won';
            opportunitiesToUpdate.add(opp);
            System.debug('Updated opportunity ' + opp.Id + ' to stage: Closed Won');
        }

        // Perform the update in a single call for efficiency
        if (!opportunitiesToUpdate.isEmpty()) {
            System.debug('Updating ' + opportunitiesToUpdate.size() + ' opportunities in bulk');
            update opportunitiesToUpdate;
        } else {
            System.debug('No opportunities found to update.');
        }
    }
}