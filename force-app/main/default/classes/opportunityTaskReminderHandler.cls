public class opportunityTaskReminderHandler {
    
    public static void createTaskReminder(List<Opportunity> newOppList,Map<Id,Opportunity> oldOppMap){
        
        List<Task> newTaskList=new List<Task>();
        
        for(Opportunity opp:newOppList){

            if(opp.StageName !=oldOppMap.get(opp.Id).StageName){
                
                if(( oldOppMap.get(opp.Id).StageName =='Perception Analysis' && opp.StageName =='Qualification') || 
                   (oldOppMap.get(opp.Id).StageName =='Perception Analysis' && opp.StageName =='Prospecting')){
                       
                       Task tas=new Task();
                       tas.WhatId=opp.Id;
                       tas.Description='Please Check What happend to this Opportunity';
                       tas.Priority='High';
                       tas.IsReminderSet=true;
                       tas.Subject='Please Check for this Opportunity';
                       tas.ReminderDateTime=System.today() + 1;
                       newTaskList.add(tas);
                   }
            }
        }
        
        if(!newTaskList.isEmpty()){
            insert newTaskList;
        }
    }
}