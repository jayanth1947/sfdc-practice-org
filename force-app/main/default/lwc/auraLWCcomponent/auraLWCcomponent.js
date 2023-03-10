import { api, LightningElement } from 'lwc';

export default class AuraLWCcomponent extends LightningElement {
    @api title
    clickHandler(){
        const cusevent= new CustomEvent('sendmsg',{
            detail:{
                "msg": "Hello from LWC"
            }
        })
        this.dispatchEvent(cusevent)
    }
}