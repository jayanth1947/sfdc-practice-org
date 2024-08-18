public class EmailSender {

    public static void sendEmail(List<String> recipientEmail, String subject, String body) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        // Set email parameters
        email.setToAddresses(recipientEmail);
        email.setSubject(subject);
        email.setHtmlBody(body);

        System.debug('Sending email to: ' + recipientEmail);
        System.debug('Subject: ' + subject);
        System.debug('Body: ' + body);

        try {
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
            System.debug('Email sent successfully.');
        } catch (EmailException e) {
            System.debug('Error sending email: ' + e.getMessage());
        }
    }
}