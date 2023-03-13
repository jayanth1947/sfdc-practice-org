import { LightningElement, wire } from 'lwc';
import {getRelatedListRecords} from 'lightning/uiRelatedListApi'
export default class RelatedListRecordsAdapter extends LightningElement {
  recordList
  @wire(getRelatedListRecords, {
    
    //For dynamic we will use @api recordId and parentRecordId:'$recordId'
    parentRecordId:'0015g00000TEKsGAAX', //Parent ID
    relatedListId:'Contacts', //Realted List API Name
    fields:['Contact.Name', 'Contact.Id'] //optional field
  })
  
  listRecordsHandler({data,error}){
    //If the data is present the data will be intialized to recordList
    if(data){
      //console.log(JSON.stringify(data))
      this.recordList = data.records
    }

    //If error occured
    if(error){
      console.error(error)
    }
  }
}