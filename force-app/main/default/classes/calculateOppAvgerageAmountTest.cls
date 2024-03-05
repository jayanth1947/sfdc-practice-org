@isTest
public class calculateOppAvgerageAmountTest {
    
    @isTest
    static void calculateAvgAmount(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=10;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.CloseDate=system.today()-1;
            opp.Amount=500;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        insert oppList;
        
        Test.startTest();
        calculateOppAvgerageAmount.calculateAvgAmount(oppList);
        Test.stopTest();
        
        Decimal sum=0;
        Decimal avg=0;
        Integer listSize=oppList.size();
        for(Opportunity opp:oppList){
            sum =sum+opp.Amount;
        }
        System.debug('Sum Of Opp Amounts '+sum);
        avg=sum/listSize;
        System.debug('Avg Amount '+avg);
        Assert.areEqual(10,oppList.size());
        Assert.areEqual(5000,sum);
        Assert.areEqual(500,avg);
    }
}