public class soqlApexDemo_3 {
    public static void mymethod(){
        
        //Dynamic SOQL
        
        String s='select ID,Name from Account';
        List<sObject> lst1=Database.query(s);
        
        //creating a qurery dynamically
        
        String s1='select ID';
        
        String []fieldList=new List<String>();
        
        fieldList.add('Name');
        fieldList.add('Phone');
        fieldList.add('AnnualRevenue');
        
        String myObject ='';
        
        for(String s2:fieldList){
            
            s1+=', '+s2;
            // s1= 'select ID,Name, Phone, AnnualRevenue'
        }
        s1+=' from ' +myObject;
        
        //s1= 'select ID,Name, Phone, AnnualRevenue from Account'
        
        //This will remove the single quotes from the query
        String s2=String.escapeSingleQuotes(s1);
        
        List<sObject> lst2=Database.query(s2);
        
        
        
    }
}