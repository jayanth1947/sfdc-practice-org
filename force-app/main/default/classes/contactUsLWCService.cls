public without sharing class contactUsLWCService {
    @AuraEnabled
    // This method accepts map , email,ownerId and Event ID
    public static void recordResponse(Map<Object, String> paramsMap ,String emailAddress,String ownerId,String eventId){

        System.debug('Params \n'+paramsMap);

        try {
            //This will get the message
            String description=paramsMap.get('Message');

            // This will get the subject
            String subjectemail='Query From'+ paramsMap.get('Name')+':'+paramsMap.get('Subject');

            // Here a new Task has been created
            Task task=new Task();
            task.Subject=subjectemail;
            task.Priority='High';
            task.Description=description;
            task.Status='Not Started';
            task.ActivityDate=System.today().addDays(1);
            task.OwnerId=ownerId;
            task.WhatId=eventId;


            //Here the task got inserted
            insert task;


            //Sending an email
            Messaging.SingleEmailMessage message=new Messaging.SingleEmailMessage();

            //To address
            message.setToAddresses(new List<String> {emailAddress});

            //cc Address
            message.setCcAddresses(new List<String> {paramsMap.get('Email')});

            //subject to the email
            message.setSubject(subjectemail);

            //Body of the email
            message.setHtmlBody(description);

            //it will create a list of emails to be send
            List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();
            emailMessages.add(message);

            List<Messaging.SendEmailResult> results = Messaging.sendEmail(emailMessages);

            for (Messaging.SendEmailResult sr : results) {

                if(!sr.isSuccess()){
                    List<Messaging.SendEmailError> errors=sr.getErrors();
                    String errorString=String.join(errors,',');
                    //if any error occured it will throw that error
                    throw new AuraHandledException(errorString);
                }
                
            }

        } 
        
        catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}