import { LightningElement } from 'lwc';

export default class Dynamic_css extends LightningElement {
    percent=10 //default value is 10
    
    changeHandler(event){ // Here the 
        this.percent=event.target.value
    }
    // Change the value of the width dynamicaly
    get percentage(){
        return `width:${this.percent}%`
    }
}