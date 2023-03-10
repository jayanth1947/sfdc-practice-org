import { LightningElement } from 'lwc';

export default class C2pMpdalComponent extends LightningElement {
    closeHandler(){
        const myevent=new CustomEvent('close',{
            detail:"Model Child" // we can also pass the object
            /*detail:{
                msg:"Model Child"
                age:20
            }*/
        })
        this.dispatchEvent(myevent)
    }
}