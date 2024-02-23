trigger preventAdditionOfNewContactRecords on Contact (before insert) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        preventAdditionOfNewContactRecordsHan.preventAddContactRecords(Trigger.new);
    }
    
    
}