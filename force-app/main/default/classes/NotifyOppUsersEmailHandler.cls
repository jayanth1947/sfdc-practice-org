public class NotifyOppUsersEmailHandler {
    
    public static void notifyUsersViaEmail(List<Opportunity> newOppList,Map<Id,Opportunity> oldOppMap){
        
        //List of Ids to Send Email
        List<Id> oppIds=new List<Id>();
        List<Id> accountIds=new List<Id>();
        List<Id> publicGroupUsers =new List<Id>();
        
        //user Ids for sending email
        Set<Id> listOfUsersToNotify=new Set<Id>();

        for(Opportunity opp:newOppList){
            //Added OppIds and AccountIds to the Lists
            oppIds.add(opp.Id);
            accountIds.add(opp.AccountId);
        }
        
        List<Account> accList= [SELECT Id,OwnerId FROM Account WHERE Id IN:accountIds];
        List<OpportunityTeamMember> oppTeamList=[SELECT UserId,OpportunityId FROM OpportunityTeamMember WHERE OpportunityId IN: oppIds];
        List<GroupMember> groupList = [SELECT Id,UserOrGroupId FROM GroupMember WHERE Group.Name ='Opportunity Mega Star'];
        
        for(GroupMember groupMem:groupList){
            publicGroupUsers.add(groupMem.UserOrGroupId);
        }
        
        for(Opportunity opp:newOppList){
            if(opp.StageName=='Closed Won' && oldOppMap.get(opp.Id).StageName !=opp.StageName){
                listOfUsersToNotify.addAll(publicGroupUsers);
                listOfUsersToNotify.add(opp.OwnerId);
                listOfUsersToNotify.add(opp.Account.OwnerId);
                
                //Added Account Owner Ids
                for(Account acc:accList){
                    if(opp.AccountId ==acc.Id){
                        listOfUsersToNotify.add(acc.OwnerId);
                    }
                }
                
                for(OpportunityTeamMember oppTeam:oppTeamList){
                    if(oppTeam.OpportunityId ==opp.Id){
                        //Added OpportunityTeamMember Ids
                        listOfUsersToNotify.add(oppTeam.UserId);
                    }
                }
            }
        }
        
        if(!listOfUsersToNotify.isEmpty()){
            sendEmailToTheseUsers(listOfUsersToNotify);
        }
        
    }
    
    //Send Email to Users
    public static void sendEmailToTheseUsers(Set<Id> userIds){
        
        List<String> emailsToSend= new List<String>();
        List<User> userEmailList =[SELECT Email FROM User WHERE Id IN: userIds];
        
        for(User userRec:userEmailList){
            emailsToSend.add(userRec.Email);
        }
       
        Messaging.SingleEmailMessage[] messages=new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage message=new Messaging.SingleEmailMessage();
        message.toAddresses=emailsToSend;
        message.subject='Please Check the Opportunity';
        message.plainTextBody='Your Opporunity is Won';
        messages.add(message);
        Messaging.SendEmailResult[] results=Messaging.sendEmail(messages);   	
    }
}