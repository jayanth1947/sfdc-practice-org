@isTest
public class CreateNLocationOnContactHandlerTest {
    
    @isTest
    static void createNLocationOnInsert(){
        
        Account acc=new Account(Name='Account');
        insert acc;
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Contact '+i;
            con.Create_N_Locations__c=6;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        Test.stopTest();
        
        List<Location__c> locList=[SELECT Id,Name,Contact__c FROM Location__c WHERE Contact__c=:conList[0].Id];
        Assert.isTrue(locList!=null,'Location Records are created');
    }
    
    
    @isTest
    static void createNLocationOnUpdate(){
        Account acc=new Account(Name='Account');
        insert acc;
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Contact '+i;
            con.Create_N_Locations__c=6;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        
        for(Contact con:conList){
            con.LastName='New Contact';
            con.Create_N_Locations__c=4;
        }
        
        update conList;
        
        Test.stopTest();
        List<Location__c> locList=[SELECT Id,Name,Contact__c FROM Location__c WHERE Contact__c=:conList[0].Id];
        Assert.isTrue(locList!=null,'Location Records are created');
    }
    
    @isTest
    static void createNLocationOnUpdateTwo(){
        Account acc=new Account(Name='Account');
        insert acc;
        List<Contact> conList=new List<Contact>();
        for(Integer i=1;i<=50;i++){
            Contact con=new Contact();
            con.LastName='Contact '+i;
            con.Create_N_Locations__c=6;
            con.AccountId=acc.Id;
            conList.add(con);
        }
        
        Test.startTest();
        insert conList;
        
        for(Contact con:conList){
            con.LastName='New Contact';
            con.Create_N_Locations__c=4;
        }
        update conList;
        for(Contact con:conList){
            con.LastName='New Contact';
            con.Create_N_Locations__c=6;
        }
        
        update conList;
        
        Test.stopTest();
        
        List<Location__c> locList=[SELECT Id,Name,Contact__c FROM Location__c WHERE Contact__c=:conList[0].Id];
        Assert.isTrue(locList!=null,'Location Records are created');
    }
}