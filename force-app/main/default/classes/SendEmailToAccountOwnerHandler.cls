public class SendEmailToAccountOwnerHandler {
    
    public static void sendEmailToAccOwner(List<Contact> newConList,Map<Id,Contact> oldConMap){
        
        List<Id> accountIds=new List<Id>();
        
        for(Contact con:newConList){
            if(con.AccountId!=null){
                //Checking for the value change in email or Phone
                if(con.Email !=oldConMap.get(con.Id).Email || con.Phone !=oldConMap.get(con.Id).Phone){
                    accountIds.add(con.AccountId);
                }
            }
        }
        
        //Getting the account owner records with associated contacts
        List<Account> accountRecords= [SELECT OwnerId,Owner.Email FROM Account WHERE Id IN: accountIds];
        
        List<String> emailOwnerList=new List<String>();
        
        for(Account acc:accountRecords){
            //Storing the emails in the form of a list
            emailOwnerList.add(acc.Owner.Email);
        }
        
        if(!emailOwnerList.isEmpty()){
            
            Messaging.SingleEmailMessage[] messages=new List<Messaging.SingleEmailMessage>();
            
            //Looping over the accountids and sending the email of the account owner 
            for(Id accId:accountIds){    
                Messaging.SingleEmailMessage message=new Messaging.SingleEmailMessage();
                message.toAddresses=emailOwnerList;
                message.subject='Contact Email or Phone Changed';
                message.plainTextBody='Your contact email or phone are modified. Please Check';
                messages.add(message);
                
            }
            
            //send an email
            Messaging.SendEmailResult[] results=Messaging.sendEmail(messages);   
        }
    }
}