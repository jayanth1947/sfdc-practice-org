// A class that schedules the OpportunityReminder class to run every day at 9 AM
public class OpportunityReminderScheduler {
  // The main method that schedules the job
  public static void scheduleJob() {
    // Create a new instance of the OpportunityReminder class
    OpportunityReminder reminder = new OpportunityReminder();
    // Create a cron expression that specifies the schedule
    // This expression means every day at 9 AM
    String cron = '0 0 9 * * ?';
    // Schedule the job using the System.schedule method
    System.schedule('Opportunity Reminder Job', cron, reminder);
  }
}