import { LightningElement, wire } from 'lwc';
import { APPLICATION_SCOPE,createMessageContext, MessageContext, publish, releaseMessageContext, subscribe, unsubscribe} from 'lightning/messageService';
import SAMPLE_MESSAGE from '@salesforce/messageChannel/SampleMessageChannel__c';
export default class LmsChannelX extends LightningElement {
    recievedMessage
    subscription
    @wire(MessageContext)
    context

    connectedCallback(){
        this.subscribeMessage()
    }

    subscribeMessage(){
        //subscribe(messageContext, messageChannel, listener, subscriberOptions)
        this.subscription= subscribe(this.context, SAMPLE_MESSAGE, (message)=>{this.handleMessage(message)}, {scope:APPLICATION_SCOPE})
    }

    handleMessage(message){
        this.recievedMessage = message.lmsData.value? message.lmsData.value :'NO Message published'
    }

    // This is for unsubscribe action
    unsubscribeMessage(){
        unsubscribe(this.subscription)
        this.subscription = null
    }
    
}
    
