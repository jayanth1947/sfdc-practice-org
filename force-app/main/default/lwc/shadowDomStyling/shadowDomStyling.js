import { LightningElement } from 'lwc';

export default class ShadowDomStyling extends LightningElement {
    isLoaded = false /*First it will be false after it will change */

    renderedCallback(){
        if(this.isLoaded) return
        const style = document.createElement('style')
        /*This will style the variable as given in the following */
        style.innerText = `c-shadow-dom-styling .slds-button{ 
            background: red;
            color: white;
        } `
        this.template.querySelector('lightning-button').appendChild(style)
        this.isLoaded = true
    }
}