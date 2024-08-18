@isTest
public class createAndUpdateOpportunityTest {
    /*
@isTest
static void createAndUpdateOpp(){
List<Opportunity> oppList=new List<Opportunity>();
Account acc=new Account(Name='Khan',active_p__c=true);
insert acc;
for(Integer i=1;i<=50;i++){
Opportunity opp=new Opportunity();
opp.Name='Salman '+i;
opp.CloseDate=System.today()+2;
opp.StageName='Needs Analysis';
opp.AccountId=acc.Id;	
opp.Account.active_p__c=true;
oppList.add(opp);
}
insert oppList;

Test.startTest();
createAndUpdateOpportunity.updateOpp();
Test.stopTest();
List<Opportunity> newoppList =[SELECT Id,Name,StageName,AccountId,Account.active_p__c,Account.Name FROM Opportunity WHERE Account.active_p__c=true];
for(Opportunity opp:newoppList){
if(opp.AccountId ==null){
opp.StageName='Prospecting';
}
Opportunity newOpp=new Opportunity();
newOpp.Name='New Opp';
newOpp.StageName='Qualification';
newOpp.CloseDate=System.today();
}
update newoppList;
} */
    
    @isTest
    static void testUpdateOpp() {
        // Create a test Account
        Account testAccount = new Account(Name = 'Test Account', active_p__c = true);
        insert testAccount;
        
        // Create a test Opportunity related to the test Account
        Opportunity testOpp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Qualification',
            CloseDate = System.today(),
            AccountId = testAccount.Id
        );
        insert testOpp;
        
        // Call the method to be tested
        createAndUpdateOpportunity.updateOpp();
        
        // Retrieve the newly created Opportunity
        List<Opportunity> newOppList = [SELECT Id, Name, StageName FROM Opportunity WHERE Name = 'Test Opportunity'];
        
        // Assert that the Opportunity was created with the expected values
        System.assertEquals(1, newOppList.size(), 'Expected one new Opportunity');
        Opportunity newOpp = newOppList[0];
        System.assertEquals('Test Opportunity', newOpp.Name, 'Unexpected Opportunity name');
        System.assertEquals('Qualification', newOpp.StageName, 'Unexpected Opportunity stage');
    }
}