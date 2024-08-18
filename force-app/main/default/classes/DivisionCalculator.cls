public class DivisionCalculator {
    public class DivideByZeroException extends Exception {}
    public static void divideNumbers(Integer num1,Integer num2){
        Integer res;
        if(num1!=null && num2!=null){
            if(num2 ==0){
                throw new DivideByZeroException('Cannot divide by zero.');	
            }
            else{
                res=num1/num2;
                System.debug('Final Result '+res);
            }  
        }
    }
}