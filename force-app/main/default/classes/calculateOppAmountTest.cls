@isTest
public class calculateOppAmountTest {

    @isTest
    static void calculateOppAmount(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Opp '+i;
            opp.CloseDate=system.today();
            opp.StageName='Prospecting';
            opp.Amount=500;
            oppList.add(opp);
        } 
        insert oppList;
        calculateOppAmount.totalOppAmount(oppList);
        
        Decimal sum=0;
        for(Opportunity opp:oppList){
            sum+=opp.Amount;  
        }
        System.assertEquals(2500,sum);
    }
}