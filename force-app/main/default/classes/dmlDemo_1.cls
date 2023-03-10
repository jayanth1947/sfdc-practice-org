public class dmlDemo_1 {
    public static void myMethod(){
        
        //DML statements
        
        //Insert
        
        //Create a Empty List
        List<Account> acc=new List<Account>();
        
        //Use for loop for create a 20 records
        for(integer i=1;i<=20;i++){
            Account a=new Account(Name='Test Account '+i);
            //add accounts to the list
            acc.add(a);
        }
        
        //Insert them into database
        insert acc;
        
        
        
        //UPDATE
        
        List<Account> acc1=[SELECT NAME FROM ACCOUNT WHERE CREATEDDATE=TODAY];
        
        for(Account a:acc1){
            a.Name=a.Name +' Updated Name';
        }
        update acc1;
        
        
        //UPSERT
        
         List<Account> acc2=[SELECT NAME,AnnualRevenue FROM ACCOUNT WHERE CREATEDDATE=TODAY];
        
        for(Account a:acc2){
            a.AnnualRevenue=25000;
        }
        
        for(Integer i=1;i<=20;i++){
            Account a=new Account(Name='Test Account in Upsert '+i);
            acc2.add(a);
        }
        upsert acc2;
        
        
        //Small Practice on UPDATE
        //
        List<Opportunity> oplst =[select Name, CloseDate from Opportunity];
        
        Date d=System.today()+9;
        
        for(Opportunity opp:oplst){
            opp.CloseDate=d;
        }
        
        update oplst;
        
        
        //Small practice on UPSERT
        
        List<Product2> prolst=[select Name from Product2];
        
        for(Product2 pro:prolst){
            pro.Name=pro.Name + ' 2022';
        }
        
        Product2 pp1=new Product2(Name ='Test Product-1');
        Product2 pp2=new Product2(Name ='Test Product-2');
        
        prolst.add(pp1); prolst.add(pp2);
        
        upsert prolst;
        
        
        
        //MERGE
        
        /*Note : we can merge 2 objects at once per transaction
         * MERGE is only work on Account,contact, leads only
         * Most probably we will not use merge statement in the real world scenarios.
        */
        
        List<Account> acclist=[select Name from Account where Name like 'Merg%' order by Name];
        
        Account a1=acclist[0];
        Account a2=acclist[0];
        Account a3=acclist[0];
        
        List<Account> merlist=new List<Account>();
        merlist.add(acclist[1]);
        merlist.add(acclist[2]);
        
        merge a1 merlist;
        
        
        
        
        
        
        
        
    }
}