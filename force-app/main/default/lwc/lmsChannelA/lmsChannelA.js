import { LightningElement, wire } from 'lwc';
import { APPLICATION_SCOPE,createMessageContext, MessageContext, publish, releaseMessageContext, subscribe, unsubscribe} from 'lightning/messageService';
import SAMPLE_MESSAGE from '@salesforce/messageChannel/SampleMessageChannel__c';
/* https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_salesforce_modules */
export default class LmsChannelA extends LightningElement {

    //variable for the input element
    inputValue

    @wire(MessageContext)
    context

    //used for the input
    inputHandler(event){
        this.inputValue = event.target.value
        console.error(error);
    }

    // Button action
    publishMessage(){
        const message={
            lmsData:{
                value:this.inputValue
            }
        }
        //publish(messageContext, messageChannel, message)
        publish(this.context, SAMPLE_MESSAGE, message)
    }
}