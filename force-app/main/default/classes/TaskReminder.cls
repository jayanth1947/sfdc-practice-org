// A class that queries and sends reminder emails for open tasks
public class TaskReminder {
  // A method that accepts a specific due date as a parameter
  public static void sendTaskReminder(Date dueDate) {
    // Query all open tasks with the given due date
    List<Task> tasks = [SELECT Id, Subject, OwnerId, Owner.Email FROM Task
                        WHERE Status != 'Completed' AND ActivityDate = :dueDate];
    // Loop through the tasks and send an email reminder for each one
    for (Task t : tasks) {
      // Create a new email
      Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
      // Set the email properties
      email.setSubject('Reminder: Task ' + t.Subject + ' is due soon');
      email.setPlainTextBody('The task ' + t.Subject + ' has a due date of ' + dueDate + '. Please complete it as soon as possible.');
      email.setTargetObjectId(t.OwnerId); // Set the recipient as the owner of the task
      email.setSaveAsActivity(false); // Do not save the email as an activity
      // Send the email
      Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
    }
  }
}