//Update the Case records
@RestResource(URLMapping='/updateContactRecords/*')
global with sharing class httpPutMethodTwo {
    
    @httpPut()
    global static String updateContactRecords(String contactName,String contactPhone,String contactEmail )
    {
        Contact contactRecords=[SELECT Id,LastName,Phone,Email FROM Contact WHERE LastName =:contactName];

        if (contactRecords.Id !=null) {
            contactRecords.Phone=contactPhone;
            contactRecords.Email=contactEmail;

            update contactRecords;
            return 'Contact record updated Successfully';
        }
        else {
            return 'Contact Record Not found and Not updated';
        }
    }

}


/*

Method - PUT
request url - /services/apexrest/updateContactRecords
Body

{
"contactName":"janu",
"contactPhone":"9874563332",
"contactEmail":"kiran1234@gmail.com"
}

*/