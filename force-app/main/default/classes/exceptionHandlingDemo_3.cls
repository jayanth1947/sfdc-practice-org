public class exceptionHandlingDemo_3 {
    
    public static void myMethod(Integer i){
        
        try{
            if(i<0){
            throw new NegativeException();
        }
        else{
            i+=10;
            System.debug(i);
        }
            
        }
        catch(NegativeException ne){
            System.debug('Exception occured'+ne.getMessage());
        }
        
    }

}