public class operatorsApexDemo {
    public static void mymethod(){
        
        //Add and subtract
        
        Integer a1=10;
        Integer a2=20;
        Integer a3=a1+a2;
        System.debug('Sum is'+a3);
        
        String s1='John';
        String s2='Paul';
        System.debug(s1+s2);
        
        double d=4.2; 
        DateTime dt= DateTime.now();
        DateTime finalDate=dt-d; //Removes four days from now
        System.debug(finalDate);
        
        
        //Equality(==)
        
        System.debug(a1==a2);
        
        //Exact Equality(===) It will allows only for the reference type
        
        Account acc=new Account();
        Contact con=new Contact();
        //System.debug(if(acc===con));
        
        
        
        //Exact Inequality(!==) returns true if the values are inequal
        
       
        
        //Relational (<,>,>=,<=)
        
        
     
    }

}