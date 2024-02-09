public class EmailUtility {
    public static void sendBulkEmail(List<String> recipientEmails) {
        if (recipientEmails != null && !recipientEmails.isEmpty()) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(recipientEmails);
            email.setSubject('Salesforce Developer');
            email.setPlainTextBody('Hi There, How do you do');
            Messaging.SendEmailResult[] sendResults = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
            if (sendResults[0].isSuccess()) {
                System.debug('Email sent successfully to recipients: ' + String.join(recipientEmails, ', '));
            } else {
                System.debug('Error sending email: ' + sendResults[0].getErrors()[0].getMessage());
            }
        } else {
            System.debug('Recipient email list is empty.');
        }
    }
}