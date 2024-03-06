@isTest
public class updatingDepartmentOnAccountTest {
    
    @isTest
    static void updateDepartment(){
        List<Account> accList = new List<Account>{
            new Account(Name='Acc1', Industry='Finance'),
                new Account(Name='Acc1', Industry='Construction'),
                new Account(Name='Acc1', Industry='Education'),
                new Account(Name='Acc1', Industry='Technology'),
                new Account(Name='Acc1', Industry='Government')
                };
                    insert accList;
        
        Test.startTest();
        updatingDepartmentOnAccount.updateDepartment(accList);
        Test.stopTest();
        Assert.areEqual(5,accList.size());
        Assert.areEqual('Finance',accList[0].Department__c);
        Assert.areEqual('Finance',accList[1].Department__c);
        Assert.areEqual('IT',accList[2].Department__c);
        Assert.areEqual('IT',accList[3].Department__c);
        Assert.areEqual('HR',accList[4].Department__c);
        
    }
}