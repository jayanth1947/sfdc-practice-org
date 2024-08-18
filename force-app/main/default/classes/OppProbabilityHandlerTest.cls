@isTest
public class OppProbabilityHandlerTest {
    
    @isTest
    static void oppHandler(){
        List<Opportunity> oppList=new List<Opportunity>();
        for(Integer i=1;i<=50;i++){
            Opportunity opp=new Opportunity();
            opp.Name='Opp '+i;
            opp.CloseDate=system.today()-2;
            opp.StageName='Prospecting';
            oppList.add(opp);
        }
        Test.startTest();
        insert oppList;
        OppProbabilityHandler.updateProbability(oppList);
        
        Map<String,Integer> stageToProbability = new Map<String, Integer>{
            'Prospecting' => 10,
                'Qualification' => 20,
                'Needs Analysis' => 30,
                'Value Proposition' => 40,
                'Id. Decision Makers' => 50,
                'Perception Analysis' => 60,
                'Proposal/Price Quote' => 70,
                'Negotiation/Review' => 80,
                'Closed Won' => 100,
                'Closed Lost' => 0
                };
                    
                    for (Opportunity opp : oppList) {
                        if (stageToProbability.containsKey(opp.StageName)) {
                            opp.Probability = stageToProbability.get(opp.StageName);
                            System.assertEquals(10,opp.Probability);
                        }
                    }
        Test.stopTest();
        System.assertEquals(50,oppList.size());
    }
}