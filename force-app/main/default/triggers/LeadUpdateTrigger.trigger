trigger LeadUpdateTrigger on Lead (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        LeadConverter.convertLead(Trigger.new);
    }
}