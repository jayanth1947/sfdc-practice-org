trigger updatecontacttitleTrigger on Contact (before insert) {
	
    if(Trigger.isBefore && Trigger.isInsert){
        updatecontacttitle.updateTitle(Trigger.new);
    }
}