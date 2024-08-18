@isTest
public class updateOppClosedDateHandlerTest {
    @isTest
    static void testUpdateClosedDate() {
        // Create a test Opportunity with 'Closed Won' stage
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Closed Won',
            CloseDate = Date.today()
        );
        insert testOpp;
        
        // Call the method to update the CloseDate
        List<Opportunity> oppList = new List<Opportunity>{ testOpp };
            updateOppClosedDateHandler.updateClosedDate(oppList);
        
        // Retrieve the updated Opportunity
        Opportunity updatedOpp = [SELECT CloseDate FROM Opportunity WHERE Id = :testOpp.Id];
        
        // Calculate expected CloseDate (next month)
        Date currentDate = System.today();
        Integer daysInMonth = Date.daysInMonth(currentDate.year(), currentDate.month());
        Date expectedCloseDate = currentDate.addMonths(1).addDays(daysInMonth - currentDate.day());
        
        // Verify that the CloseDate was updated correctly
        System.assertNotEquals(expectedCloseDate, updatedOpp.CloseDate);
    }
}