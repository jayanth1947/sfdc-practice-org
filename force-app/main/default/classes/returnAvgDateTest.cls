@isTest
public class returnAvgDateTest {

    @isTest
    static void oppAvgDate(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity opp=new Opportunity();
            opp.Name='John '+i;
            opp.CloseDate=system.today();
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        insert oppList;
        
        Test.startTest();
        returnAvgClosedDate.returnAvgDate();
        Test.stopTest();
    }
}