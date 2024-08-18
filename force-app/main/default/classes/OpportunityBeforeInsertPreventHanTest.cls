@isTest
public class OpportunityBeforeInsertPreventHanTest {

    @isTest
    static void preventUserToInsert(){
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='Opp1 '+i;
            opp.CloseDate=system.today() +3;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        Boolean exceptionThrown =false;
        try{
            insert oppList;
        }
        catch(Exception e){
             exceptionThrown =true;
            Boolean expectedErrorThrown=(e.getMessage().contains('You dont have the rights to insert this record')) ? true : false;
            Assert.areEqual(false,expectedErrorThrown);
        }
        Test.stopTest();
    }
}