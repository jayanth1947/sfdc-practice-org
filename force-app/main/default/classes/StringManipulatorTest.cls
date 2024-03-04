@isTest
public class StringManipulatorTest {
/*
    @isTest
    static void reverseString(){
        String str='Mom';
        if(str ==null){
            System.assertEquals(null,str);
        }
        /*List<String> strList=new List<String>{'MoM','DaD'};
            for(String str:strList){
                if(str ==str.reverse()){
                    System.debug('Reversed Strings');
                }
            } 
        Test.startTest();
        StringManipulator.reverseString(str);
        Test.stopTest();
    } */
     @isTest
    static void testReverseString() {
        // Test with a non-null string
        String inputString = 'Hello, World!';
        String reversedString = StringManipulator.reverseString(inputString);
        System.assertEquals('!dlroW ,olleH', reversedString);

        // Test with a null string
        String nullString = null;
        String reversedNullString = StringManipulator.reverseString(nullString);
        System.assertEquals(null, reversedNullString);
    }
}