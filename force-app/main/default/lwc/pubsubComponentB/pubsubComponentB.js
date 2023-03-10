import { LightningElement } from 'lwc';
import pudsub from 'c/pudsub';
export default class PubsubComponentB extends LightningElement {
    message
    connectedCallback(){
        this.callSubscriber()
    }
    callSubscriber(){
        pudsub.subscribe('componentA',(message)=>{
            this.message=message
        })
    }
}