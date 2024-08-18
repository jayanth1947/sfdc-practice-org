public class CreateNLocationOnContactHandler {
    
    public static void createLocationRecords(List<Contact> newConList, Map<Id,Contact> oldConMap){
        
        List<Location__c> newLocList=new List<Location__c>();
        List<Location__c> deleteLocList=new List<Location__c>();
        Map<Id,Location__c> existingLocMap;
        
        if(oldConMap !=null){
            existingLocMap=new Map<Id,Location__c>([SELECT Id,Name,Contact__c FROM Location__c WHERE Contact__c IN :oldConMap.keySet()]);
        }
        
        for(Contact con:newConList){
            Integer deleteRecords=0;
            if(Trigger.isInsert){
                for(Integer i=0; i<con.Create_N_Locations__c ;i++){
                    Location__c newLoc=new Location__c();
                    newLoc.Name='Location '+i;
                    newLoc.Contact__c=con.Id;
                    newLocList.add(newLoc);
                }
            }
            else if(Trigger.isUpdate){
                if(oldConMap.get(con.Id).Create_N_Locations__c != con.Create_N_Locations__c){
                    
                    if(oldConMap.get(con.Id).Create_N_Locations__c < con.Create_N_Locations__c){
                        Integer newRecords= (Integer)(con.Create_N_Locations__c - oldConMap.get(con.Id).Create_N_Locations__c);
                        for(Integer i=0; i<newRecords; i++){
                            Location__c newLoc=new Location__c();
                            newLoc.Name='Location '+i;
                            newLoc.Contact__c=con.Id;
                            newLocList.add(newLoc);
                        }
                    }
                    
                    else if(oldConMap.get(con.Id).Create_N_Locations__c > con.Create_N_Locations__c){
                        deleteRecords= (Integer)(oldConMap.get(con.Id).Create_N_Locations__c - con.Create_N_Locations__c);
                        
                        for(Location__c loc:existingLocMap.values()){
                            if(loc.Contact__c == con.Id){
                                if(deleteLocList.size() < deleteRecords){
                                    deleteLocList.add(loc);
                                }
                            }
                        }
                    }
                }
                
            }
        }
        
        if(!newLocList.isEmpty()){
            insert newLocList;
        }
        if(!deleteLocList.isEmpty()){
            delete deleteLocList;
        }
    }
}