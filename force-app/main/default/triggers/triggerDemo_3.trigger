trigger triggerDemo_3 on Account (before update) {
    
    //Context variables
    
    //3.Trigger.old
    
    Account aOld=Trigger.old[0]; //old value gets stored
    
    Account aNew=Trigger.new[0]; //new value gets stored
    
    System.debug('Old Value'+aOld.Name);
    
    System.debug('New Value'+aNew.Name); 
    
    

}