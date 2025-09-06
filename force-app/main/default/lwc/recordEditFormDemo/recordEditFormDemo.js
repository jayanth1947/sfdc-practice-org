import { LightningElement,api } from 'lwc';

// Getting Contact Object and requried fields
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';

//import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation'


export default class RecordEditFormDemo extends NavigationMixin(LightningElement) {

    // Variables for Object and recordId
    objectName = CONTACT_OBJECT
    @api recordId;
    fields={ 
        accountId:ACCOUNTID_FIELD,
        nameField:NAME_FIELD,
        titleField:TITLE_FIELD,
        phoneField:PHONE_FIELD,
        emailField:EMAIL_FIELD
    }

    // It will handle the cancel button
    handleReset(event){ 
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if(inputFields){ 
            Array.from(inputFields).forEach(field=>{ 
                field.reset()
            })
        }
    }

    // It will handle the save button
    handleSave(){
        this[NavigationMixin.Navigate]({ 
            type:'standard__objectPage',
            attributes:{ 
                objectApiName:'Contact',
                actionName:'list'
            },
            state:{
                filterName:'Recent'
            }
        })
    }

}