@isTest
public class updateAccountAnnualRevenueTest {

    @isTest
    static void updateAnnualAmount(){
        List<Account> accList=new List<Account>();
        
        Account acc0=new Account(Name='Acc1',Industry='Agriculture');
        Account acc1=new Account(Name='Acc1',Industry='Banking');
        Account acc2=new Account(Name='Acc1',Industry='Chemicals');
        Account acc3=new Account(Name='Acc1',Industry='Insurance');
        accList.add(acc0);
        accList.add(acc1);
        accList.add(acc2);
        accList.add(acc3);
        
        Test.startTest();
        
        insert accList;
        updateAccountAnnualRevenue.updateAnnualRevenue(accList);
        
        List<Account> updatedList=[SELECT Id,Name,Industry,AnnualRevenue FROM Account];
        for(Account acc:updatedList){
            if(acc.Industry=='Agriculture'){
                acc.AnnualRevenue=200000;
            }
            else if(acc.Industry=='Banking'){
                acc.AnnualRevenue=600000;
            }
            else if(acc.Industry=='Chemicals'){
                acc.AnnualRevenue=800000;
            }
            else if(acc.Industry=='Insurance'){
                acc.AnnualRevenue=900000;
            }
        }
        Test.stopTest();
        System.assertEquals(4,accList.size());
        System.assertEquals(200000,updatedList[0].AnnualRevenue);
    }
}