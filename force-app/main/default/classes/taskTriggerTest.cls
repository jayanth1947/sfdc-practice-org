@isTest
public with sharing class taskTriggerTest {
    @isTest
    static void taskCreate() {
        Task testTask = [SELECT Subject FROM Task WHERE WhoId = : [SELECT Id FROM Lead].Id];
        System.assertEquals('Test Task', testTask.Subject);
    }
}

