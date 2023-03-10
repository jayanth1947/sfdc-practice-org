/*trigger triggerName on sObject(Trigger Events){
*  
    code Execution
}

*/
trigger triggerDemo_1 on Account (before update) {
    
    Account a=Trigger.new[0];
    a.Name=a.Name +' Updated Trigger';

}