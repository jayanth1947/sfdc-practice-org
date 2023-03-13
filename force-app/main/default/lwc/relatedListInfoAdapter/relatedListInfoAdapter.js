import { getRelatedListInfo } from 'lightning/uiRelatedListApi';
import { LightningElement, wire } from 'lwc';

export default class RelatedListInfoAdapter extends LightningElement {

    relatedListData
    @wire(getRelatedListInfo,{
        parentObjectApiName:'Account', //Parent API name for the object
        relatedListId:'Contacts' //API name for the relatedList 

    })
    listHandler({data,error}){
        if(data){
            //If it is true the data is assigned
            //console.log(JSON.stringify(data));
            this.relatedListData=data.displayColumns
        }
        //If it is error ,error is displayed
        if(error){
            console.error(error);
        }

    }
}