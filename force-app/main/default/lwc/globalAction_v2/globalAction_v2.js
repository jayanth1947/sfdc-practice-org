import { LightningElement, api } from 'lwc';
// Importing the updateRecord function from the uiRecordApi module and the STAGENAME_FIELD and ID_FIELD fields from the schema for the Opportunity object
import {updateRecord} from 'lightning/uiRecordApi'
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName'
import ID_FIELD from '@salesforce/schema/Opportunity.Id'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class globalAction_v2 extends LightningElement {
    // Declaring an @api property called recordId
    @api recordId;

    // Declaring an @api function called invoke()
    @api invoke(){

        // Creating an empty fields object and populating it with the recordId and the value 'Closed' for the STAGENAME_FIELD
        const fields = {}
        fields[ID_FIELD.fieldApiName] = this.recordId
        fields[STAGENAME_FIELD.fieldApiName] = 'Closed'

        // Creating a recordInput object with the fields object as a property
        const recordInput = {fields}

        // Calling the updateRecord function with the recordInput object as an argument
        updateRecord(recordInput)
        .then(()=>{
            // If the update is successful, calling the showToast function with success parameters
            this.showToast("Success!!", "Opportunity closed successfully", "success")
        }).catch(error=>{
            //error handling
            // If there is an error, calling the showToast function with error parameters
            this.showToast("Error!!", error.message, "error")
        })
    }

    // Declaring a showToast function that takes a title, message, and variant as parameters and dispatches a ShowToastEvent with those parameters
    showToast(title, message, variant){
        this.dispatchEvent(new ShowToastEvent({
            title, message, variant
        }))
    }
}