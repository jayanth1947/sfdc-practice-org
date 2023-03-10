public class databaseMethodsDemo {
    public static void mymethod(){
        
        //Database Calss
        
        //syntax
        /*Database.insert(List,allorNone);
         * Here allorNone Parameter is set 'false'
           it will partially success the records and if any error
		   occurs it will throw that error.	
		*/
        
        
        //Database.insert
        
        List<Contact> cc=new List<Contact>();
        
        Contact c1=new Contact(firstName='Konvey',lastName='Roy');
        
        Contact c2=new Contact(firstName='John',lastName='Shai');
        
        Contact c3=new Contact();
        cc.add(c1);cc.add(c2);cc.add(c3);
		
        //Insert
        Database.SaveResult[] res=Database.insert(cc, false);
        
        for(Database.SaveResult srr:res){
            if(srr.isSuccess()){
                System.debug('Success'+srr.getId());
            }
            else{
                for(Database.Error err:srr.getErrors()){
                    System.debug('Error Occured');
                    System.debug(err.getMessage());
                    System.debug(err.getFields());
                }
            }
        }
        
        
        //Update
        
        List<Contact> cclst=[select ID,firstName from contact where firstName like 'Virat%'];
        
        for(Contact cc1:cclst){
            cc1.LeadSource='Phone Inquiry'; 
            cc1.Languages__c='Telugu';
        }
        
        //Update
        Database.SaveResult[] updres=Database.update(cclst, false);
        
         for(Database.SaveResult srr:updres){
            if(srr.isSuccess()){
                System.debug('Success'+srr.getId());
            }
            else{
                for(Database.Error err:srr.getErrors()){
                    System.debug('Error Occured');
                    System.debug(err.getMessage());
                    System.debug(err.getFields());
                }
            }
        }
        
        
        //UPSERT
        
         List<Contact> ccuplst=[select ID,firstName from contact where firstName like 'John%'];
        
        for(Contact cc1:ccuplst){
            cc1.LeadSource='Phone Inquiry'; 
            cc1.Languages__c='English';
        }
        
        //New Record
        Contact newcc=new Contact(firstName='Kaul',lastName='Paul');
        ccuplst.add(newcc);
        
        //Update
        Database.UpsertResult[] updres1=Database.upsert(ccuplst, false);
        
         for(Database.UpsertResult srr:updres1){
            if(srr.isSuccess()){
                System.debug('Success'+srr.getId());
            }
            else{
                for(Database.Error err:srr.getErrors()){
                    System.debug('Error Occured');
                    System.debug(err.getMessage());
                    System.debug(err.getFields());
                }
            }
        }
        
        
        //Delete
        
        List<Contact> dellst=[select ID,firstName from contact where firstName like 'John%'];
        
        Database.DeleteResult[] del=Database.delete(dellst,false);
        
       //EmptyRecycleBin
       
       List<Contact> emplst=[select ID,firstName from contact where isDeleted=true ALL ROWS];
       
       Database.emptyRecycleBin(emplst); 
        
        
        
        
        
        
        
        
    }
}