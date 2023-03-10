import { deleteRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DeleteRecordAdapter extends LightningElement {
    //variable for the record Id
    recordId

    //Any changes are occured this method will be fired
    changeHandler(event){
        this.recordId=event.target.value


    }

    //button action executed here
    deleteHandler(){
        deleteRecord(this.recordId)
        .then(()=>{
            //console.log("Deleted Successfully");
            this.showToast("Success","Deleted Successfully",'success') //displays success message

        })
        .catch(error=>{
            console.error(error);
            this.showToast("Error!","Error Occurred",'error') //displays error message
        })
    }

    //This method will displays the messages of error and success
    showToast(title,message,variant){
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant
        }))
    }
}