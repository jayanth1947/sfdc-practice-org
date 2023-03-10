public class exceptionHandlingDemo {
    public static void myMethod(Integer i){
        
        //Exception Handling
        
        //try block --used for error might occur
        //catch block-- It will catch the exception
        //finally block-- It will execute irrespestive of the error
        try{
            if(i==0){
                Integer a;
                Integer b=a+5;  //Throws NullPointerException
            }
            
            else{
                Account acc=new Account();
                insert acc;
            }
            
        }
        
        catch(NullPointerException e){
            System.debug('It will throw null Pointer Exception');
            System.debug('Define a value to that variable');
            
        }
        
        catch(DmlException e){
            System.debug('It will throw DML Exception');
            
        }
        
        finally{
            System.debug('Always execute whether their is an exception or not');
        }
        
    }
}