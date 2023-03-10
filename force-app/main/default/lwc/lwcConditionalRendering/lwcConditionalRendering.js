import { LightningElement } from 'lwc';

export default class LwcConditionalRendering extends LightningElement {
    isInvisible=false
    data
    handleClick(){
        this.isInvisible=true
    }
    // By using getter method
    handleInputFocus(event){
        this.data=event.target.value
    }
    get dataShowed(){
        return this.data==="hello"
    }
}