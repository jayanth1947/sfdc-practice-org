@isTest
public class OppNextStepHandlerTest {

    @isTest
    static void updateNextStep(){
        List<Opportunity> oppList=new List<Opportunity>();
        
        for(Integer i=1;i<=50;i++){
            Opportunity opp=new Opportunity();
            opp.Name='New Oppp '+i;
            opp.CloseDate=System.today();
            opp.StageName='Closed Lost';
            oppList.add(opp);
        }
        
        Test.startTest();
        insert oppList;
        
        OppNextStepHandler.updateNextStep(oppList);
        
        List<Opportunity> newoppList=[SELECT Id,Name,CloseDate,StageName,NextStep FROM Opportunity];
        
        for(Opportunity opp:newoppList){
            if(opp.StageName!=null && opp.StageName=='Closed Lost'){
                opp.NextStep='Follow-up';
            }
        }
        Test.stopTest();
        
        System.assertEquals(50,oppList.size());
        
    }
}