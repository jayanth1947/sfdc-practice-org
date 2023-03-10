trigger ContentVersionTrigger on ContentVersion (after insert) {
    contentVersionTriggerHandler.createPublicLinkFile(Trigger.New,Trigger.newMap);

}