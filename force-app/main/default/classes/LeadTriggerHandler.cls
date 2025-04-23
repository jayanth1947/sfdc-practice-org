/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
public with sharing class LeadTriggerHandler {
    public static void sendEmailtoeadOwnerL(List<Lead> leadList) {
        // add a attachment to the email if necessary
        if(!leadList.isEmpty()) {
            List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
            for(Lead lead : leadList) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] {lead.Owner.Email});
                email.setSubject('New Lead Assigned');          
                Attachment attachment = new Attachment();
                attachment.setContentType('text/plain');
                attachment.setFileName('LeadDetails.txt');
                attachment.setBody('Lead Name: ' + lead.Name + '\nLead Email: ' + lead.Email);
                attachment.setParentId(lead.Id);
                email.setFileAttachments(new Messaging.EmailFileAttachment[] {attachment});
                emailList.add(email);
            }
            if(!emailList.isEmpty()) {
                Messaging.sendEmail(emailList);
            }
        } 

    }
}