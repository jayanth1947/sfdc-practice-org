@isTest
public class test_class_demo_1Test {

    @isTest
    public static void testAddTwoNumbers() {

        Integer expectedSum = 30;

        Test.startTest();
        Integer actualSum = test_class_demo_1.addTwoNumbers();
        Test.stopTest();
        System.assertEquals(expectedSum, actualSum, 'Sum should be 30');
    }
}