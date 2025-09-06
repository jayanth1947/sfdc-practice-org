//Update the Case records
@RestResource(URLMapping='/updateCaseRecords/*')
global with sharing class httpPutMethod {
    
    @httpPut()
    global static String updateCaseRecords(String caseNumber, String caseStatus, String caseReason,
                                            String casePriority )
    {
        Case caseRecords=[SELECT Id,caseNumber,Status,Priority,Reason FROM Case WHERE caseNumber =:caseNumber];

        if (caseRecords.Id !=null) {
            caseRecords.Status=caseStatus;
            caseRecords.Reason=caseReason;
            caseRecords.Priority=casePriority;

            update caseRecords;
            return 'case record updated Successfully';
        }
        else {
            return 'Case Record Not found and Not updated';
        }
    }

}


/*

Method - PUT
request url - /services/apexrest/updateCaseRecords
Body

{
"caseNumber":"00001033",
"caseStatus":"Working",
"caseReason" :"Performance",
"casePriority":"Low"
}

*/