import { LightningElement,api } from 'lwc';
// Used for Notification
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

// Getting Account Object and requried fields
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordFormDemo extends LightningElement {

    // varaibles for recordId and Object
    @api recordId
    @api objectApiName
    objectName=ACCOUNT_OBJECT
    fieldName=[NAME_FIELD,TYPE_FIELD,INDUSTRY_FIELD,ANNUALREVENUE_FIELD]

    // It will handle the success message
    successHandler(event){
        console.log(event.detail.id)
        const closeEvent=new ShowToastEvent({
            title:"Account Created",
            message:"Record Id :" + event.detail.id,
            variant:"success"
        })
        this.dispatchEvent(closeEvent)
    }
}