public without sharing class userUtility {
    @AuraEnabled(cacheable=true)
    public static string fetchUserName(){
        return userInfo.getName();
        
    }
}