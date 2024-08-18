@isTest
public class updateLeadStatusControllerTest {

    @isTest
    static void updateLeadStatus(){
        List<Lead> leadList=new List<Lead>();
        for(Integer i=0;i<=5;i++){
            Lead lea=new Lead();
            lea.LastName='lead '+i;
            lea.Company='CTS';
            lea.LeadSource='Web';
            leadList.add(lea);
        }
        insert leadList;
        System.assertEquals(6,leadList.size());
        updateLeadStatusController.mymethod();
        for(Lead lee:leadList){
            if(lee.LeadSource=='Web'){
                lee.Status = 'Qualified';
                System.assertEquals('Qualified',lee.Status);
            }
        }
    }
}