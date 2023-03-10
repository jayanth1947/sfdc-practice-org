public with sharing class UtilityClass {
    public UtilityClass() {

    }
    @AuraEnabled
    public static Map<Integer, String> mapDemo(){
        Map<Integer, String> utilityMap = new Map<Integer, String>();
        utilityMap.put(1,'Jayanth');
        utilityMap.put(2,'Kalyan');
        utilityMap.put(3,'Lilly');
        utilityMap.put(4,'Killy');
        return utilityMap;
    }
}