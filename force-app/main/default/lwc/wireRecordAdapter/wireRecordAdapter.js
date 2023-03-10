import { getRecord,getFieldValue,getFieldDisplayValue } from 'lightning/uiRecordApi';
import { api, LightningElement,wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import OWNER_NAME_FIELD from '@salesforce/schema/Account.OwnerId';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class WireRecordAdapter extends LightningElement {
    name
    owner
    AnnualRevenue
    @api recordId;

    //This is used to fetchparticular fields of that object
    @wire(getRecord,{recordId:'$recordId',
    fields:[NAME_FIELD,OWNER_NAME_FIELD,ANNUAL_REVENUE_FIELD]})

    //This is the second method for the records fetching
    /*@wire(getRecord,{recordId:'$recordId',
    layoutTypes:['Full'],modes:['View']})*/

   /* accountHandler({data}){
        if(data){
            console.log(data);
            this.name=data.fields.Name.displayValue ? data.fields.Name.displayValue:
            data.fields.Name.value
            this.owner=data.fields.OwnerId.displayValue ? data.fields.OwnerId.displayValue:
            data.fields.OwnerId.value
            this.AnnualRevenue=data.fields.AnnualRevenue.displayValue ? data.fields.AnnualRevenue.displayValue:
            data.fields.AnnualRevenue.value

        }
    }*/

    //getFieldValue this adapter
    /*accountHandler({data}){
        if(data){
            console.log(data);
            this.name=getFieldValue(data,NAME_FIELD)
            this.owner=getFieldValue(data,OWNER_NAME_FIELD)
            this.AnnualRevenue=getFieldValue(data,ANNUAL_REVENUE_FIELD)

        }
    } */

    //getFieldDisplayValue
    accountHandler({data}){
        if(data){
            console.log(data);
            this.name=getFieldValue(data,NAME_FIELD)
            this.owner=getFieldValue(data,OWNER_NAME_FIELD)
            this.AnnualRevenue=getFieldDisplayValue(data,ANNUAL_REVENUE_FIELD)

        }
    }



}