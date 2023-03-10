public class collectionsDemo {
    public static void myMethod(){
        
        //List is same as arrays
        //Intialize of the list
        List<Integer> l1=new List<Integer>();
        
        //Add values to the list
        l1.add(22);
        l1.add(35);
        
        //Another way for inti and assign values
        
        List<String> str=new List<String>{'My','Name','is','Naveen Reddy'};
            
            //List array Notation
            
        List<Integer> l2=new  Integer[5];
        
        l2[0]=10;
        l2[1]=12;
        l2[2]=15;
        l2[3]=20;
        l2[4]=30;
        
        System.debug(l2);
        
        //Methods in List
        System.debug(l2.size()); // Get the size
        System.debug(l2.get(2)); //Get the index value of the 2
        l2.remove(3); //Remove the value in the index 3
        
        List<Integer> l3= l2.clone(); //assigned to the l3
        l3.set(2,35);
        //System.debug(l3.sort());
        System.debug(l3.isEmpty());
        //System.debug(l3.clear());
        
        //Nested list
        //2D list
        
        List<List<Integer>> list2d=new  List<List<Integer>>();
        
        //--------------------- OR -----------------------------
        
        List<List<Integer>> list2demo= new  List<List<Integer>>{new List<Integer>{10,20,30,40},
            new List<Integer>{50,60,70,80},new List<Integer>{90,880,330,430}};
        
        // The above format is also same for the 2d list...............
                
        
        //Here we are creating the single list and adding to the above 2d list
        
        List<Integer> list2d1=new List<Integer>{10,20,30,40};
        List<Integer> list2d2=new List<Integer>{50,60,70,80};
        List<Integer> list2d3=new List<Integer>{90,880,330,430};
        
        list2d.add(list2d1);
        list2d.add(list2d2);
        list2d.add(list2d3);
        
        System.debug(list2d);
        
       System.debug(list2demo);
        
        
        
        
        //SETS
        
        //Set Intialization
        Set<Integer> s1= new Set<Integer>();
        
        //-------------------------OR------------------------------
        
        Set<Integer> s2= new Set<Integer>{2,4,35,6};
        
        //Add values to set
        s1.add(2);
        s1.add(4);
        s1.add(3);
        System.debug('Set collection'+s1);
        
        
        //sObject in SET
        
        Set<Account> setAcc = new Set<Account>();
        
        //Here in the Account set new set-1 is one added and the duplicate
        //account is not added
        Account a1=new Account(Name='New Set-1',AnnualRevenue=10000);
        Account a2=new Account(Name='New Set-2',AnnualRevenue=20000);
        Account a3=new Account(Name='New Set-3',AnnualRevenue=10000);
        Account a4=new Account(Name='New Set-1',AnnualRevenue=10000);
        
        //Add account records to the SET
        setAcc.add(a1);
        setAcc.add(a2);
        setAcc.add(a3);
        setAcc.add(a4);
        
        //Show the length of the SET
        System.debug('Set Size'+setAcc.size());
        
        
        //Methods in SET
        
        List<Integer> lst=new List<Integer>{9,8,5};
            
        s2.addall(lst); // Add the elements to the set
        
        System.debug(s2.contains(9)); //Returns true if the element is there in the set
        
        System.debug(s2.containsAll(lst)); //Returns true if the elements in the set are in the list also
        
        System.debug(s2.size()); //Returns length of the set
        
        System.debug(s2.retainAll(l1)); // Removes the element that are not present in the set
        
        Set<Integer> s3=s2.clone(); //Copy the elements to s3
        
        s3.remove(3); //Removes the element '3' from the set
        
        s3.removeAll(lst); //Remove all the list from the set
        
        s3.clear(); //Removes all the elemeents from the set
        
        
        
        //MAP Collection
        
        /* Map<Datatype_key, DataType_value> vName =new Map<Datatype_key, DataType_value>();
         
			Here the KEY should be only Primitive Datatype

		*/
        
        //Map Intialization
        
        Map<Integer,string> nmap=new Map<Integer,string>();
        
        //----------------------OR---------------------------------
        
        //Intialize and assign the values like this
        
        Map<Integer,string> map1=new Map<Integer,string>{1=>'Ummi',2=>'Jimmy',3=>'Tommy'};
        
        
        //Add elements to map
        
        // puy(key,value);
        nmap.put(11, 'John');
        nmap.put(12, 'James');
        nmap.put(13, 'kiran');
        
        nmap.put(11, 'divi'); //It will override and replace it with divi
        System.debug('Map Collection'+nmap);
        
        
        //Methods in MAP
        
        nmap.putAll(map1); //Add all the map elements to one map
        
        System.debug(nmap.get(11)); //Return the element
        
        System.debug(nmap.isEmpty()); //Return true if the elements are there
        
        System.debug('Map Length :'+nmap.size()); //Returns length
        
        nmap.remove(12); //Remove the element with the key
        
        nmap.clear(); //Clear the elements from the maps
           
   
         
    }
}