import { LightningElement } from 'lwc';

export default class C2pParentComponent extends LightningElement {
    showModel=false
    msg
    clickHandler(){
        this.showModel=true

    }
    closeHandler(event){
        this.msg=event.detail //Pass the object =event.detail.age  
        this.showModel=false
    }
}