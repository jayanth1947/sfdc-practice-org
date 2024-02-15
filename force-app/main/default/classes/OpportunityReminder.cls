// A class that implements the Schedulable interface
public class OpportunityReminder implements Schedulable {
  // The execute method is called by the scheduler
  public void execute(SchedulableContext ctx) {
    // Get the list of open opportunities whose close date is within 7 days
    
    List<Opportunity> opps = [SELECT Id, Name, CloseDate, Account.Name FROM Opportunity
                              WHERE IsClosed = FALSE AND CloseDate = NEXT_N_DAYS:7];
    // Loop through the opportunities and send an email reminder for each one
    
    for (Opportunity opp : opps) {
      // Create a new email
      Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
      // Set the email properties
      email.setSubject('Reminder: Opportunity ' + opp.Name + ' is closing soon');
      email.setPlainTextBody('The opportunity ' + opp.Name + ' with account ' + opp.Account.Name +
                             ' has a close date of ' + opp.CloseDate + '. Please take action accordingly.');
      email.setTargetObjectId(opp.OwnerId); // Set the recipient as the owner of the opportunity
      email.setSaveAsActivity(false); // Do not save the email as an activity
      // Send the email
      Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
    }
  }
}