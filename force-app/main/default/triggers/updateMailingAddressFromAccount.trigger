trigger updateMailingAddressFromAccount on Contact (before insert) {
	
    if(Trigger.isBefore && Trigger.isInsert){
        updateMailingAddressFromAccountHandler.updateMailingAddress(Trigger.new);
    }
    
}