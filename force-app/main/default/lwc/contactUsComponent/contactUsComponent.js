import { api, LightningElement } from 'lwc';
import recordResponse from '@salesforce/apex/contactUsLWCService.recordResponse';
export default class ContactUsComponent extends LightningElement {

    /* This initializes an empty object called __emailMessage that will hold the
     details of the email to be sent.*/
    __emailMessage={};


    @api eventId; //related task to the event.. which is used to store the Id of the task object related to the event.
    @api organizerEmail; //email of the organizer .  which is used to store the email address of the organizer.
    @api organizerOwner; //owner of the organizer.  which is used to store the owner of the organizer.

    __isSpinnerActive=false; //which is used to show or hide a spinner while sending the email.


    /*This is a method that is called when any input field in the form changes. 
    It sets the value of the input field to the corresponding field in the __emailMessage object. */
    handleChange(event){
        const field=event.target.name;
        const value=event.target.value;
        this.__emailMessage[field]=value;
    }


    /* This is a method that is called when the "Send" button in the form is clicked. 
    It first validates the input fields by calling the validateInput method. 
    If the input is valid, it sets __isSpinnerActive to true and calls the recordResponse method 
    to send the email. It then dispatches a custom event called success to notify the parent component 
    that the email was sent successfully. If there is any error while sending the email, it logs the 
    error to the console. */
    handleSend(event){
        event.preventDefault();

        if(this.validateInput()){ //here we added extra ()
            this.__isSpinnerActive=true;

            recordResponse({
                paramsMap:this.__emailMessage,
                emailAddress:this.organizerEmail,
                ownerId:this.organizerOwner,
                eventId:this.eventId
            })

            .then((result) => {
                this.dispatchEvent(new CustomEvent('success',{
                    detail:'success'
                }));

            }).catch((error) => {
                console.log("Error:",error);
            })
            .finally(()=>{
                this.__isSpinnerActive=false;
            });
        }

    }



    /*
    - It first calls the "preventDefault" method on the "event" object to prevent
     the default action of the cancel event. This is important because it stops the page 
     from refreshing or navigating to a different page.
    - It then creates a new CustomEvent object using the "CustomEvent" constructor, passing
     in the string 'cancel' as the event type and an object containing the detail information as the event detail.
    - Finally, it dispatches the custom event using the "dispatchEvent" method, passing in the custom 
    event object as the parameter. This causes the LWC to notify any parent components that are listening for the 'cancel' 
    event that the cancel action has been triggered.
 */
    handleCancel(event){
        event.preventDefault();
        this.dispatchEvent(new CustomEvent('cancel',{
            detail:'cancel'
        }));    
    }



    /*
    - It first retrieves all the "lightning-input" components in the LWC using the "querySelectorAll" method, 
    and stores them in an array called "allValid".
    - It then uses the "reduce" method to iterate over each input component in "allValid".
    - For each input component, it calls the "reportValidity" method to show any validation messages,
      and then calls the "checkValidity" method to check if the value is valid. \
      If the value is valid, the "reduce" method returns "true" for the "validSoFar" variable; otherwise, it returns "false".
    - The "reduce" method accumulates the values returned by each iteration and returns the final result in the "allValid" variable.
    - The function then repeats steps 1-4 for all the "lightning-textarea" components in the LWC and stores the result in the "allValidMessage" variable.
    - Finally, the function returns the logical AND of "allValid" and "allValidMessage". This means that if either "allValid" or "allValidMessage" is false, 
      the function will return false, indicating that the input values are not valid. 
      */
    validateInput(){
        const allValid=[...this.template.querySelectorAll('lightning-input')]
        .reduce((validSoFar,inputCmp)=>{
            inputCmp.reportValidity();
            return validSoFar && inputCmp.checkValidity();
        },true);

        const allValidMessage=[...this.template.querySelectorAll('lightning-textarea')]
        .reduce((validSoFar,inputCmp)=>{
            inputCmp.reportValidity();
            return validSoFar && inputCmp.checkValidity();
        },true);

        return allValid && allValidMessage;

        
    }
}