trigger ContactUpdateWebSiteTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        ContactUpdateWebSiteHandler.updateWebsiteOnContacts(Trigger.new,Trigger.oldMap);
    }
}