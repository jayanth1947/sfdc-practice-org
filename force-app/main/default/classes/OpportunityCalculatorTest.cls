@isTest
public class OpportunityCalculatorTest {

    @isTest
    static void calulateOpp(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=50;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opportunity '+i;
            opp.CloseDate=system.today()+1;
            opp.Amount=100;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        
        OpportunityCalculator.calculateTotalValue();
        
        Decimal totalAmount=0;
        List<Opportunity> newoppList= [SELECT Id,Amount FROM Opportunity WHERE Amount!=null];
        for(Opportunity opp:newoppList){
            totalAmount+=opp.Amount;
        }
        Test.stopTest();
        Assert.areEqual(50,oppList.size());
        System.debug('Total Opportunity Value '+totalAmount);
    }
}