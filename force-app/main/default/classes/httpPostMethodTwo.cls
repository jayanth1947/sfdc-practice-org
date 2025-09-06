@RestResource(URLMapping='/bulkAccountRecords/*')
global with sharing class httpPostMethodTwo {
    
    @httpPost()
    global static String bulkRecords(){
        String accountRecords=RestContext.request.requestbody.ToString();

        List<Account> accountToInsert=(List<Account>) System.JSON.deserialize(accountRecords, List<Account>.class);

        if (!accountToInsert.isEmpty()) {
            insert accountToInsert;
            return 'Account Records Inserted';
        }
        else {
            return 'Not Inserted';
        }

    }
}


/*

Method - POST
request - /services/apexrest/bulkAccountRecords

Body
[
{"Name" :"Test Integration Account - 1"},
{"Name" :"Test Integration Account - 2"},
{"Name" :"Test Integration Account - 3"},
{"Name" :"Test Integration Account - 4"},
{"Name" :"Test Integration Account - 5"}
]

*/