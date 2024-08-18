public class OppProbabilityHandler {
    public static void updateProbability(List<Opportunity> oppList){
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
                        }
                    }
    }
}