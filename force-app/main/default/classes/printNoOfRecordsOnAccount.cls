public class printNoOfRecordsOnAccount {

    public static void displayNoOfRecords(){
        
        List<Account> accList=[SELECT Id,Name,Industry FROM Account WHERE Industry!=null];
        
        System.debug('No of Records with Industry Field '+accList.size());
    }
}