@isTest
public class OpportunityBeforeUpdateHandlerTest {

    @isTest
    static void populateClosedReason(){
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='Opp1 '+i;
            opp.CloseDate=system.today() +3;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        
        for(Opportunity opp:oppList){
            opp.StageName='Closed Lost';
        }
       
        
        Boolean exceptionThrown =false;
        try{
             update oppList;
        }
        catch(Exception e){
             exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('Please Populate Closed Reason')) ? true : false;
            Assert.areEqual(true,expectedErrorThrown);
        }
        Test.stopTest();
    }
}