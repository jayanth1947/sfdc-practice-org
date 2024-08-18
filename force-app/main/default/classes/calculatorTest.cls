@isTest
public class calculatorTest {

    @isTest
    static void addTwoNumbers(){
        
        Test.StartTest();
        Decimal res=calculator.addnumbers(10,20);
        Test.StopTest();
        System.assertEquals(30,res);
    }
    
    @isTest
    static void subtractTwoNumbers(){
        
        Test.StartTest();
        Decimal res=calculator.subtractnumbers(20,10);
        Test.StopTest();
        System.assertEquals(10,res);
    }
    
    @isTest
    static void multiplyTwoNumbers(){
        
        Test.StartTest();
        Decimal res=calculator.multiplynumbers(10,20);
        Test.StopTest();
        System.assertEquals(200,res);
        
        
    }
    
    @isTest
    static void divideTwoNumbers(){
        
        Test.StartTest();
        Decimal res=calculator.dividenumbers(20,10);
        Test.StopTest();
        System.assertEquals(2,res);
    }
    
    @isTest
    static void testNullInputs() {
        Decimal nullResult = calculator.addnumbers(null, 5.3);
        System.assertEquals(0, nullResult);

        Decimal subtractNullResult = calculator.subtractnumbers(10.5, null);
        System.assertEquals(0, subtractNullResult);

        Decimal multiplyNullResult = calculator.multiplynumbers(null, 5.3);
        System.assertEquals(0, multiplyNullResult);

        Decimal divideNullResult = calculator.dividenumbers(10.5, null);
        System.assertEquals(0, divideNullResult);
    }
}