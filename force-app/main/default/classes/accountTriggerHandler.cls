/**
 * @description       : 
 * @author            : Jayanth Onteru
 * @group             : 
 * @last modified on  : 04-23-2025
 * @last modified by  : Jayanth Onteru
**/
public with sharing class accountTriggerHandler {
    public static void sendEmailToAllRelContacts(List<Account> newAccList) {

        Set<Id> contactIds = new Set<Id>();
        if(!newAccList.isEmpty()){
            for(Account acc:newAccList){
                contactIds.add(acc.Id);
        }
    }

    if(!contactIds.isEmpty()){
            List<Contact> conList = [SELECT Id, Email, Account.Name, Account.Owner.Email,AccountId FROM Contact WHERE AccountId IN :contactIds];
            List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

            for(Contact con:conList){
                List<String> toAdd = new List<String>();
                toAdd.add(con.Email);
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();    
                email.setToAddresses(toAdd);
                email.setSubject('New Account Assigned');
                email.setPlainTextBody('Account Name: ' + con.Account.Name + '\nAccount Owner Email: ' + con.Account.Owner.Email);
                email.setHtmlBody('Account Name: ' + con.Account.Name + '<br/>Account Owner Email: ' + con.Account.Owner.Email);
                email.setReplyTo(con.Account.Owner.Email);
                email.setBccSender(false);
                email.setUseSignature(false);
                email.setSaveAsActivity(false);
                email.setTargetObjectId(con.Id);
                email.setWhatId(con.AccountId);


                emailList.add(email);

    }
}
            if(!emailList.isEmpty()){
                        Messaging.sendEmail(emailList);
                    }
            }
}