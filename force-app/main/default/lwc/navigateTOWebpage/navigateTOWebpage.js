import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigateTOWebpage extends NavigationMixin(LightningElement) {
    navigateToWeb(){
        this[NavigationMixin.Navigate]({ 
            type:"standard__webPage",
            attributes:{ 
                url:"https://www.google.com"
            }
        })
    }
}