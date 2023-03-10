/*public class arrayClass {
    public arrayClass(){
        integer marks[]=new integer[] {100,50,85,60};
            String names[]=new String[] {'jayanth','jannu','jimmy'};
                for(integer i:marks){
                System.debug('Marks'+i);
                }
    }
    
}*/
public class Arrays {
public Arrays()
{
    Integer [] marks = new Integer [] {10,20,50,55,33,65,43};
        String [] citynames = new String [] {'chennai','kolkata','nagaland','UK','bihar'};
            String [] prodname = new String [] {'Pepsi','Coca Cola','Fresho','Spicy Lays','Spicy Lemon Lays'};
                String [] accounts = new String [] {'Acc1','Acc2','Acc3'};
                    Integer [] contacts = new Integer [] {4356789,657898,657856,65758};
                        Integer [] cases = new Integer [] {1,7,4,8,4,102};

    for(integer i:marks)
    {
        system.debug('Marks: '+i);
    }
    for(string i:citynames)
    {
        system.debug('City Names: '+i);
    }
    for(string i:prodname)
    {
        system.debug('Product Names: '+i);
    }
    for(string i:accounts)
    {
        system.debug('Account Names: '+i);
    }
    for(integer i:contacts)
    {
        system.debug('Contacts: '+i);
    }
    for(integer i:cases)
    {
        system.debug('Cases: '+i);
    }
}
}