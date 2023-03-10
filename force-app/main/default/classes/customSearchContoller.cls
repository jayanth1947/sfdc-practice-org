public with sharing class customSearchContoller {
    @AuraEnabled
    public static string searchRecords(String objName,String fieldName,String searchKey){

        //SOSL query
        String searchKeyword=searchKey+'*';
        String returningQuery=objName+'( Id, '+fieldName+')';
        String query='FIND :searchKeyword IN ALL FIELDS RETURNING '+returningQuery+'LIMIT 2000';
        List<List<sObject>> sObjectList = Search.query(Query);
        return JSON.serialize(sObjectList);
    }
}