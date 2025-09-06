import { LightningElement } from 'lwc';

export default class ParentComponentTwo extends LightningElement {

    count=1;

    // Here the count will be incremented
    handleEventChange(){
        this.count=this.count+1;
    }
}