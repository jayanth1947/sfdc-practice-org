public class Salary {  
private integer no_of_hours;	// instance variables   
private integer rs_per_hour;	// instance variables  
private integer total_salary;	// instance variables 
public void set(integer n, integer r)	{   
// formal parameter            
no_of_hours = n;   
rs_per_hour = r;  
}
     
public void show()   {   
total_salary = no_of_hours*rs_per_hour;   
System.debug('total salary = '+total_salary);  
} 
}