import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigatetoVF extends NavigationMixin(LightningElement) {
    navigatetoVF(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
                url:'/apex/navigatetoVFTarget'
            }
            // It will come in the promise and it is then created to catch it
        }).then(generatedUrl=>{
            window.open(generatedUrl,"_blank")
        })
    }
}