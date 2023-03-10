import { LightningElement } from 'lwc';
import pudsub from 'c/pudsub';
export default class PubsubComponentA extends LightningElement {
    message
    inputHandler(event){
        this.message=event.target.value

    }
    btnHandler(){
        pudsub.publish('componentA',this.message)
    }
}