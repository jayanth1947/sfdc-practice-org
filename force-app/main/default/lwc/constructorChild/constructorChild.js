import { LightningElement } from 'lwc';

export default class ConstructorChild extends LightningElement {
    constructor(){
        super()
        console.log("child constrcutor called")
    }
    connectedCallback(){
        console.log("child constructor callback called")
        throw new error('Child throws an error')
    }
    renderedCallback(){
        console.log("child rendered callback called")
    }
    disconnectedCallback(){
        alert('child cmp has been removed')
    }
}