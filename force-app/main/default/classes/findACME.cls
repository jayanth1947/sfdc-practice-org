public class findACME {

    public static void findACMEonAcclead(){
        List<list<SObject>> searchList= [FIND 'Acme' IN Name FIELDS RETURNING Account(Name),Lead(Name)];
        System.debug(searchList);
        
    }
}