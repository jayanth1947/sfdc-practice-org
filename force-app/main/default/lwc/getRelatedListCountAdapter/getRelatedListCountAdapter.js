import { getRelatedListCount } from 'lightning/uiRelatedListApi';
import { api, LightningElement, wire } from 'lwc';

export default class GetRelatedListCountAdapter extends LightningElement {
    relatedData
    @api recordId
    @wire(getRelatedListCount,{
        parentRecordId:'$recordId',//Id of the parent Record
        relatedListId:'Contacts', //The API name of the related list Object such as Contacts,opportunity

    })

    //Handler for the above wire adater
    listCountHandler({error,data}){
        //If the data is there it will assign to the relatedData
        if(data){
           // console.log(JSON.stringify(data));
            this.relatedData=data
        }
        if(error){
            //error exists
            console.error(error);
        }
    }
}