@isTest
public class OpportunityStageUpdaterTest {
/*
    @isTest
    static void updateOppStage(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=50;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.CloseDate=system.today()-2;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        insert oppList;
        OpportunityStageUpdater.updateOpportunityStages();
        List<Opportunity> updateOppList=new List<Opportunity>();
        List<Opportunity> oppToUpdate=[SELECT Id,Name,StageName,CloseDate FROM Opportunity WHERE StageName = 'Prospecting'];
        for(Opportunity opp:oppToUpdate){
            opp.StageName='Closed Won';
            updateOppList.add(opp);
        }
        if(!updateOppList.isEmpty()){
            update updateOppList;
        }
        else {
            System.debug('No opportunities found to update.');
        }
    } */
    
     @IsTest
    static void testUpdateOpportunityStages() {
        // Create test opportunities with different close dates and stages
        Opportunity opp1 = new Opportunity(Name = 'Test Opportunity 1', CloseDate = Date.today().addDays(-1), StageName = 'Prospecting');
        Opportunity opp2 = new Opportunity(Name = 'Test Opportunity 2', CloseDate = Date.today().addDays(1), StageName = 'Negotiation');
        Opportunity opp3 = new Opportunity(Name = 'Test Opportunity 3', CloseDate = Date.today(), StageName = 'Closed Lost');
        insert new List<Opportunity>{opp1, opp2, opp3};

        // Call the method to update opportunity stages
        Test.startTest();
        OpportunityStageUpdater.updateOpportunityStages();
        Test.stopTest();

        // Verify that the stages have been updated as expected
        Opportunity updatedOpp1 = [SELECT StageName FROM Opportunity WHERE Id = :opp1.Id];
        Opportunity updatedOpp2 = [SELECT StageName FROM Opportunity WHERE Id = :opp2.Id];
        Opportunity updatedOpp3 = [SELECT StageName FROM Opportunity WHERE Id = :opp3.Id];

        System.assertEquals('Closed Won', updatedOpp1.StageName);
        System.assertEquals('Negotiation', updatedOpp2.StageName);
        System.assertEquals('Closed Lost', updatedOpp3.StageName);
    }
}