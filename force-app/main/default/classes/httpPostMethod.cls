// Create a Restful WebService to insert 2 Lead records inside an object
@RestResource(URLMapping='/bulkLeadRecords/*')
global with sharing class httpPostMethod {
    
    @httpPost()
    global static String bulkRecords(){
        String leadRecords=RestContext.request.requestbody.ToString();

        List<Lead> leadsToInsert=(List<Lead>) System.JSON.deserialize(leadRecords, List<Lead>.class);

        if (!leadsToInsert.isEmpty()) {
            insert leadsToInsert;
            return 'Lead Records Inserted';
        }
        else {
            return 'Not Inserted';
        }

    }
}


/*

Method - POST
Request - /services/apexrest/bulkLeadRecords
[{
"FirstName" :"Kiran",
"LastName" : "Reddy",
"Company" :"CTS",
"LeadSource":"Web"
},

{
"FirstName" :"Hema",
"LastName" : "Rekha",
"Company" :"Accenture",
"LeadSource":"Phone"
}]

*/