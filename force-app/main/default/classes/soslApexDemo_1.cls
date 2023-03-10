public class soslApexDemo_1 {
    public static void mymethod(){
        
        
        //SOSL --Salesforce Object Search Language
        
        /*Syntax (Only in Query Editor)
         Find {what} IN {what Type} Returning {Where}
         what--- what to search
         what Type-- what fields need to search
         Where --- On which object need to search
        
         Eg -- Find {Jayanth} IN Name Fields Returning Account,Contact
		 


		 Syntax (Only in Apex)
         Find 'what' IN {what Type} Returning {Where}
         what--- what to search
         what Type-- what fields need to search
         Where --- On which object need to search
        
         Eg -- Find 'Jayanth' IN Name Fields Returning Account,Contact
		 
        */
        
        
        //Apex SOSL
        
        //Always need to specify the objects
        List<List<sObject>> lst=[Find 'Jayanth' Returning Account,Contact];
        
        //With Specific fields
        List<List<sObject>> lst1=[Find 'Jayanth' Returning Account(Name,AnnualRevenue),Contact(firstName,lastName)];
        //Returning to the list<sobject> =[0---account,1----contact]
        
        
        
        //Access SOSL 
        
        List<Account> acclst=lst1[0]; 
        
        List<Contact> con=lst1[1];
        
        for(Account a:acclst){
            System.debug(a.Name);
            System.debug(a.AnnualRevenue);
        }
        for(Contact c:con){
            System.debug('First Name'+c.firstName);
            System.debug('Last Name'+c.lastName);
        }
        
        //For Custom Objects
        
        List<List<sObject>> cus=[Find 'Jayanth' Returning Case_Action__c(Name,Status__c),Employee__c(Name,Role__c)];
        
        List<Case_Action__c> ca=cus[0];
        
        List<Employee__c> em=cus[1];
        
        for(Case_Action__c c:ca){
            System.debug('Name'+c.Name);
            System.debug('Status'+c.Status__c);
        }
        
        for(Employee__c emp:em){
            System.debug('Name'+emp.Name);
            System.debug('Role'+emp.Role__c);
        }
        
         //Search Groups
         
        //All Fields
        
        List<List<sObject>> acc=[Find 'cognizant' IN ALL FIELDS Returning Account,Contact];
        
        List<Account> act=acc[0];
        
        List<Contact> ctc=acc[1];
        
        for(Account a:act){
            System.debug('Account'+a);
        }
        
        for(Contact c:ctc){
            System.debug('Contact'+c);
        }
        
        
        //NAME FIELDS --- It will search in the NAME fields in that objects
        
        List<List<sObject>> acc1=[Find 'cognizant*' IN NAME FIELDS Returning Account,Contact];
        
        List<Account> act1=acc1[0];
        
        List<Contact> ctc1=acc1[1];
        
        for(Account a:act1){
            System.debug('Account'+a);
        }
        
        for(Contact c:ctc1){
            System.debug('Contact'+c);
        }
        
        
        //EMAIL FIELDS --- '* means one or more characters'
        
        
        List<List<sObject>> acc2=[Find '*com' IN EMAIL FIELDS Returning Account,Contact(firstName,lastName,Email)];
        
        
        List<Contact> ctc2=acc2[1];
        
       
		for(Contact c:ctc2){
            System.debug('Contact'+c.Email);
        }
        
        
        //PHONE FIELDS
        
         List<List<sObject>> acc3=[Find '123*' IN PHONE FIELDS Returning Contact(firstName,lastName,Phone)];
        
        
        List<Contact> ctc3=acc3[0];
        
       
		for(Contact c:ctc3){
            System.debug('Phone'+c.Phone);
        }
        
        
        //* ---> 0 or N characters
        
        List<List<sObject>> llst=[Find '*anth' IN NAME FIELDS returning Contact];
        
        //? ----> 1 Character only
        
        List<List<sObject>> llst1=[Find 'J?nth' IN NAME FIELDS returning Contact];
        
        
        //Clauses in SOSL
        
        List<List<sObject>> llst2=[Find 'umm*' returning Account(Name where AnnualRevenue >100)];
        
        List<Account> acc12=llst2[0];
        
        for(Account acco:acc12){
            System.debug('Account'+acco);
        }
        
        
        //ORDER BY
        
         List<List<sObject>> llst3=[Find 'united' returning Account(Name,AnnualRevenue where AnnualRevenue >100 ORDER BY Name DESC)];
        
        List<Account> acc13=llst3[0];
        
        for(Account acco:acc13){
            System.debug('Account'+acco.AnnualRevenue);
        }
        
        //LIMIT in SOSL
        
         List<List<sObject>> llst4=[Find 'jayanth' returning Contact(firstName,lastName ORDER BY firstName LIMIT 5)];
        
        List<Contact> acc14=llst4[0];
        
        for(Contact acco:acc14){
            System.debug('First Name :'+acco.firstName);
            System.debug('Last Name :'+acco.lastName);
        }
        
        
        //SOSL keywords
        
        //AND
        
        List<List<sObject>> lstt=[Find 'jayanth AND cognizant' returning Account,contact];
        
        List<Contact> cnt=lstt[1];
        for(Contact cc:cnt){
            System.debug('Con'+cc);
        }
        
        //OR
        
         List<List<sObject>> lstt1=[Find 'jayanth OR cognizant' returning Account,contact];
        
        List<Contact> cnt1=lstt1[1];
        for(Contact cc:cnt1){
            System.debug('Con'+cc);
        }
        
        
        
        
        
        
        
        
        
        
    }
}