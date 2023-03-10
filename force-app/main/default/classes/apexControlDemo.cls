public class apexControlDemo {
    public static void mymethod(){
        Integer n1=10; Integer n2=20;
       
        
        //IF condition
        if(n1>n2){
            System.debug('Good morning');
        }
        
        
        
        //If - else Condition
        if(n1>n2){
            System.debug('Good morning');
        }
        else{
            System.debug('Bad morning');
        }
        
        
        
        //IF- else if 
        
        if(n1>n2){
            System.debug('Good morning');
        }
        else if(n1<n2){
            System.debug('Bad morning');
        }
        else{
            System.debug('Hi There');
        }
        
        
        
        //shorthand IF
        
         // Integer n3=(n1>=n2) ? System.debug('Hi There') :System.debug('Bye There');        
        
        
        
        //While loop
        Integer i=0;
        while(i<5){
            System.debug('Hi There');
            i++;
        }
        
        
        //do-while loop
        Integer j=0;
        do{
            System.debug('Bye There');
            j++;
            
        }while(j<5);
        
        
        
        
        //for loop
        
        for(integer k=0;k<=5;k++){
            System.debug('Hi There in for loop');
        }
        
        
        
        /*for-each loop
         
         * It will used mostly in sObjects and lists,sets
         
         */
        
        List<Integer> lst=new List<Integer>{2,3,56,78,8};
            for(Integer a1:lst){
                a1=a1 + 2;
                System.debug('For each it will add'+a1);
            }
        
        
        
    }

}