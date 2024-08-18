public class shareContactRecordToPublicHandler {

    public static void shareContactRecord(List<Contact> newConList){
        Id conInnovationGroup =[SELECT Id,Name FROM Group WHERE Name= 'Contact Innovators' LIMIT 1].Id;
        
        List<ContactShare> conShareList= new List<ContactShare>();
        for(Contact conRec:newConList){
            ContactShare conSha=new ContactShare();
            conSha.ContactId=conRec.Id;
            conSha.ContactAccessLevel='Edit';
            ConSha.RowCause='Manual';
            conSha.UserOrGroupId=conInnovationGroup;
            conShareList.add(conSha);
        }
        
        if(!conShareList.isEmpty()){
			insert conShareList;
        }
    }
}