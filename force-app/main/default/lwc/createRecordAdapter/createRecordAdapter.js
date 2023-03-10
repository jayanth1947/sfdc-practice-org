import Contact_Object from '@salesforce/schema/Contact';
import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordAdapter extends LightningElement {

    // This line defines an empty object called formFields, which is used to store the field values entered by the user in the form.
    formFields={}

    /*This line defines a method called changeHandler that is called when the user enters a value in a form field. 
      The method extracts the name and value properties of the form field and stores them in the formFields object.*/
    changeHandler(event){
        const {name,value}=event.target
        this.formFields[name]=value

    }

    //This method is used for the button action
    /*. The method creates a new record input object using the apiName and fields properties.
    -   It then calls the createRecord method to create a new record and displays a toast message to indicate success or failure.
    -   Finally, the method resets the form and clears the formFields object. */
    handlebtn(){

        /*This line creates a new recordInput object that contains the API name of the Contact object 
        and the fields to be set on the new record.
        -  The apiName property is set to Contact_Object.objectApiName, which is the API name of the Contact 
           object imported from the schema. The fields property is set to this.formFields, which is an object that
           contains the field values entered by the user in the form. */
        const recordInput={apiName:Contact_Object.objectApiName,fields:this.formFields}

        createRecord(recordInput)
        .then(result=>{
            this.showToast("SUCESS !!", `Contact Created with is ${result.id}`) //displays the toast message

            //This line resets the form by calling the reset method on the form element retrieved using querySelector.
            this.template.querySelector('form.createForm').reset()
            
            //This line clears the formFields object by setting it to an empty object.
            this.formFields={}
        })

        .catch(error=>{

            /*the showToast method defined earlier to display an error message with the error message returned by Salesforce. 
            The error.body.message property contains the error message returned by Salesforce.*/
            this.showToast("Error while creating",error.body.message,'error')
        })
    }

    //This is used for showing the  toast message on the screen when the message is sucsess or error

    /*The method dispatches a new ShowToastEvent with the given title, message, and variant properties. */
    showToast(title,message,variant){
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant:variant || 'success'
        }))
    }
}