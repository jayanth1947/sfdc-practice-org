public class exceptionHandlingDemo_2 {
    public static void myMethod(){
        
        //System defined Exception
        
        //---1.DML Exception----------------------------------
        
        try{
            Account a=new Account();
            insert a;
        }
        
        catch(DmlException exp){
            System.debug('Exception occured'+exp.getMessage());
        }
        
        
        //--- 2.ListException------------------------------
        
        try{
        List<Integer> lst=new List<Integer>{1,2,3,4,5};
        
        System.debug(lst.get(1));
        System.debug(lst.get(2));
        System.debug(lst.get(3));
        System.debug(lst.get(4));
        
        System.debug(lst.get(5)); //It will throw the ListException because there is no index '5' value in the list
        }
        
        catch(ListException le){
            System.debug('Throws Exception '+le.getMessage());
        }
        
        
        //---- 3. NullPointerException--------------
        
        try{
            //Ex-1
            Integer s1; //Null value
            Integer s2=s1*4; //Here it will throw a exception
            
            //Ex-2
            List<String> strlst;
            strlst.add('Jayanth'); //It will throw an error
        }
        
        catch(NullPointerException npe){
            System.debug('Throws the null pointer Exception '+npe.getMessage());
        }
        
        
        //-----4.QueryException--------------------
        
        try{
            //It will throw a error while we are storing multiple records in a single sIbject
            Contact c=[select firstName from Contact where firstName='jayanth'];
        }
        
        catch(QueryException qe){
            System.debug('Query exception'+qe.getMessage());
        }
        
        
        //-----5. sOject Exception-----------------------
        
        
        try{
            List<Account> acc=[select Name from Account];
        
        for(Account a:acc){
            System.debug(a.AnnualRevenue); /*It will cause occur because we are 
                                          accessing the field which is not pulled by the query*/
        }
        }
        
        catch(SObjectException soe){
            System.debug('Exception occur'+soe.getMessage());
                
        }
        
        
        //Generic Exception -- This shloud be at the last catch block white it contains multiple catch blocks
        
        
		try{
            Contact c=[select firstName from Contact where firstName='jayanth'];
            
            List<Account> acc=[select Name from Account];
            for(Account a:acc){
            System.debug(a.AnnualRevenue);
            }
            
            Account a=new Account();
            insert a;
        }
        
        catch(QueryException qe){
            System.debug('Query exception'+qe.getMessage());
        }
        

        catch(DmlException exp){
            System.debug('Exception occured'+exp.getMessage());
        }
        
        catch(Exception e){ //generic Exception Parent class for all the exception classes
            System.debug('Exception occured'+e.getMessage());
        }
        
        
        
        
        
        //Exception Methods
        
        try{
            Account a=new Account();
            insert a;
        }
        
        catch(DmlException exp){
            System.debug('Exception occured'+exp.getMessage());
            
            System.debug(exp.getLineNumber());
            
            System.debug(exp.getTypeName());
            
            System.debug(exp.getCause());
        }
        
        
        
        
        
        
        
    }

}