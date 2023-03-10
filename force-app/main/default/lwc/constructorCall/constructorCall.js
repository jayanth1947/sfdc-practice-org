import { LightningElement } from 'lwc';

export default class ConstructorCall extends LightningElement {
    isChildVisible=false
    constructor(){
        super()
        console.log("parent constrcutor called")
    }
    connectedCallback(){
        console.log("connected callback called")
    }
    renderedCallback(){
        console.log("rendered callback called")
        
    }
    changeHandler(){
        this.isChildVisible= !this.isChildVisible
    }
    errorCallback(error,stack){
        console.log(error.message);
        console.log(stack);
    }
    
}