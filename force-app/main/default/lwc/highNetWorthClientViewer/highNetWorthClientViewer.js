import { LightningElement, api, wire, track } from 'lwc';
import getAccountDetails from '@salesforce/apex/AccountViewController.getAccountDetails';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';


export default class HighNetWorthClientViewer extends LightningElement {
    @api recordId;
    @track accountDetails;
    @track error;
    @track isLoading = true;
    wiredAccountResult;

    @wire(getAccountDetails, { accountId: '$recordId' })
    wiredAccount(result) {
        this.isLoading = true;
        this.wiredAccountResult = result; 
        if (result.data) {
            this.accountDetails = result.data;
            this.error = undefined;
            console.log('Account Details: ', JSON.stringify(this.accountDetails));
        } else if (result.error) {
            this.error = result.error;
            this.accountDetails = undefined;
            console.error('Error fetching account details: ', JSON.stringify(result.error));
        }
        this.isLoading = false;
    }

    get showInsufficientPrivileges() {
        return this.accountDetails && this.accountDetails.displayMode === 'insufficient_privileges';
    }

    get showRecordForm() {
        return this.accountDetails && this.accountDetails.displayMode !== 'insufficient_privileges' && this.accountDetails.hasRecordAccess;
    }

    get errorText() {
        if (this.error) {
            if (this.error.body && this.error.body.message) {
                return this.error.body.message;
            }
            if(this.error.message){
                return this.error.message;
            }
            return 'Unknown error';
        }
        return '';
    }

    handleSubmit(event) {
        event.preventDefault(); // stop the form from submitting
        const fields = event.detail.fields;
        
        this.template.querySelector('lightning-record-form[mode="edit"]').submit(fields);
        this.isLoading = true;
    }

    handleSuccess(event) {
        this.isLoading = false;
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Account updated successfully.",
            variant: "success",
        });
        this.dispatchEvent(evt);
        // Refresh the data
        return refreshApex(this.wiredAccountResult);
    }

     handleSuccessView(event) {
        // This might be called if the record form in view mode somehow triggers success (e.g. inline edit on fields if enabled by layout)
        // For a pure readonly form, this might not be strictly necessary but good to have.
        const evt = new ShowToastEvent({
            title: "Record Loaded",
            message: "Account details displayed.",
            variant: "info",
            mode: "pester"
        });
        // this.dispatchEvent(evt); // Can be noisy, consider if needed
    }

    handleError(event) {
        this.isLoading = false;
        let errorMessage = 'Unknown error';
        if(event.detail && event.detail.message){
            errorMessage = event.detail.message;
        } else if (event.detail && event.detail.detail){ 
            errorMessage = event.detail.detail;
        }

        const evt = new ShowToastEvent({
            title: "Error",
            message: "Error processing record: " + errorMessage,
            variant: "error",
        });
        this.dispatchEvent(evt);
        console.error('Error on record form: ', JSON.stringify(event.detail));
    }
}