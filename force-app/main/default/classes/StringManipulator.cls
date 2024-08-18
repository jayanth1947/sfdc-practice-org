public class StringManipulator {
    public static String reverseString(String str){
        
        if (str == null) {
            return null;
        }
        
        String reversed = '';
        for (Integer i = str.length() - 1; i >= 0; i--) {
            reversed += str.substring(i, i + 1);
            
        }
        System.debug(reversed);
        return reversed;
    }
}


/* String rever ='Jayanth';

System.debug(rever.reverse());
System.debug(rev.reverse());        
return rev.reverse(); */