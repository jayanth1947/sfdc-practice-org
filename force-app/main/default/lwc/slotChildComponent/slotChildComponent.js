import { LightningElement } from 'lwc';

export default class SlotChildComponent extends LightningElement {
    handleFooterChange(){
        const footer=this.template.querySelector('.slds-card__footer')
        if(footer){
            footer.classList.remove('slds-hide')
        }
    }
    
}