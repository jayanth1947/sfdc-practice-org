import { LightningElement } from 'lwc';

export default class ChildComponentTwo extends LightningElement {

    // Handle the click event
    handleClick(){

        // Here new custom event is created and the name of the event is increasecount
        this.dispatchEvent(new CustomEvent('increasecount'))
    }
}