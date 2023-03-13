import { getRelatedListsInfo } from 'lightning/uiRelatedListApi';
import { LightningElement, wire } from 'lwc';

export default class RelatedListInfosAdapter extends LightningElement {
    relatedData
    @wire(getRelatedListsInfo,{
        parentObjectApiName:'Account' //Api Name for the object
    })
    listRelatedHandler({data,error}){
        if(data){
            //console.log(JSON.stringify(data));
            this.relatedData=data.relatedLists
        }
        if (error) {
            console.error(error);
        }
    }
}