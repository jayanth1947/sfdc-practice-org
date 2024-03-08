@isTest
public class preventUserToModifyLeadHandlerTest {
    
    @isTest
    static void preventUser(){
        List<Lead> leadList=new List<Lead>();
        for(Integer i=0;i<=5;i++){
            Lead lea=new Lead();
            lea.LastName='lead '+i;
            lea.Company='CTS';
            lea.LeadSource='Web';
            leadList.add(lea);
        }
        
        Test.startTest();
        insert leadList;
        
        
        for(Lead lea:leadList){
            lea.Company='Capgemini';
        }
        
        Boolean exceptionThrown =false;
        try{
            update leadList;
        }
        catch(Exception e){
            exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('You Can not Modify this record')) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
    } 
    
    
}