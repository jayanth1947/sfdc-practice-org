public class soqlApexDemo {
    public static void mymethod(String str){
        
        //The result of the SOQL Query is stored in the List of sObject
        
        //List<sObject> variableName=[SOQL Query];
        List<Account> acc=[SELECT NAME, PHONE FROM ACCOUNT LIMIT 5];
        
        //In the below loop we are displaying the result
        for(integer i=0;i<acc.size();i++){
            System.debug('Account Name'+acc[i].Name); //Returns only the name of the Account
        }
        
        
        //By using for-each loop we can also achieve the same functionality
        for(Account a:acc){
            System.debug('Account Name: '+a.Name +' Account Phone: '+a.Phone);
        }
        

        
        //SOQL Variable binding
        List<Account> con=[select Name ,Phone from Account where Name= :str];
        
        
        
        //Aggrigate functions
        //SUM
        AggregateResult agr=[select sum(Amount) from Opportunity];
        
        System.debug('Total Amount'+agr);
        
        
        //MAX
        AggregateResult agr1=[select max(Amount) from Opportunity];
        
        System.debug('Total Amount'+agr1);
        
        
        //MIN
        AggregateResult agr2=[select min(Amount) from Opportunity];
        
        System.debug('Total Amount'+agr2);
        
        
        //COUNT
        Integer i=[select count() from Opportunity];
        
        
        //Count with the Field
        AggregateResult agr3= [select count(ID) from Opportunity];
        
        
        //Return the result as no of field Amounts is inserted
        AggregateResult agr4= [select count(Amount) from Opportunity];
        
        
        //AVG
        //Retrun the result of the avg
        AggregateResult agr5= [select AVG(Amount) from Opportunity];
        
        
        //Count_Distinct
        //This will return the result of the unique values of the Amount Field.
        AggregateResult agr6= [select Count_Distinct(Amount) from Opportunity];
        
        
        //To access the Result of the AggrigateResult
        //Here 'expr0' is the key of that aggrigate Result.
        Integer i2=(Integer)agr6.get('expr0');
        System.debug(i2);
        
        
        //SOQL Keywords
        //IN ---- It is used to compare the multiple values to a single field at once.
        List<String> lst=new List<String>{'John','Kalyan','Manu','simha'};
        
        List<Account> acc1=[select Name from Account where Name IN :lst];
        System.debug('Account Name IN '+acc1);
        
        //-----------------------------OR---------------------------------------------
        
        Set<ID> set1=new Set<ID>{'0015g00000rddM8AAI','0015g00000fgVnnAAE'};
            
        List<Account> acc2=[select Name from Account where ID IN :set1];
        
        //Note : Map is not used because it is not iterable
        
        
        //NOT
        List<Account> acc3=[select Name from Account where Name NOT IN :lst];
        System.debug('Account Name IN '+acc3);

        
        //LIKE
        List<Account> acc4=[select Name from Account where Name LIKE 'Manju'];
        
        //Like followed by '%' --> 0 or more characters
        List<Account> acc5=[select Name from Account where Name LIKE 'Manju%'];
        
        //In between the characters of the specified string
        List<Account> acc6=[select Name from Account where Name LIKE '%ton%'];
        
        //Like followed by the '_' ---> single Character
        List<Account> acc7=[select Name from Account where Name LIKE 'Burlington_'];
            
        //AND ------OR---
        
        //AND is used for checking both the conditions
        List<Account> acc8=[select Name from Account where AnnualRevenue >1000 AND Type='Prospect'];
        
        //OR
        List<Account> acc9=[select Name from Account where AnnualRevenue >1000 OR Type='Prospect'];
 
        //ORDER BY
        
        List<Account> acc10=[select Name,AnnualRevenue from Account ORDER BY AnnualRevenue];
        
        //ORDER BY ASC
        
        List<Account> acc11=[select Name,AnnualRevenue from Account ORDER BY AnnualRevenue ASC];
        
        //ORDER BY DESC
        
        List<Account> acc12=[select Name,AnnualRevenue from Account ORDER BY AnnualRevenue DESC];
        
        //NULLS FIRST
        
        List<Account> acc13=[select Name,AnnualRevenue from Account ORDER BY AnnualRevenue NULLS FIRST];
        
        //NULLS LAST
        
        List<Account> acc14=[select Name,AnnualRevenue from Account ORDER BY AnnualRevenue NULLS LAST];
        
        //GROUP BY
        
        //Return the values of the stageName fiels of opp
        List<AggregateResult> oppo=[select StageName from Opportunity GROUP BY StageName];
        
        //Return the count of each stageName
        List<AggregateResult> oppo2=[select COUNT(ID),StageName from Opportunity GROUP BY StageName];
        
        //It will return the max amount with the group by of the stagename
        List<AggregateResult> oppo3=[select StageName, MAX(Amount) from Opportunity GROUP BY StageName];
        
        
        
        //LIMIT
        List<Account> accl=[select Name from Account LIMIT 5];
        
        
        List<Account> accll=[select Name from Account order by Name LIMIT 5 ];
        
        
        //DATE LITERALS
        
        //Yesterday
        List<Account> acclist=[select Name from Account where createdDate =yesterday];
        
        //Today
        List<Account> acclist1=[select Name from Account where createdDate =today];
        
        //Tomorrow
        List<Account> acclist2=[select Name from Account where createdDate =tomorrow];
        
        //last-week or last-month
        List<Account> acclist3=[select Name from Account where createdDate =last_week];
        
        List<Account> acclist4=[select Name from Account where createdDate =last_month];
        
        //Note : Not only this we can also have many in the guide of developer.
        
        
        
       
        
        
        
        
        
        
        
        
        
    }
}