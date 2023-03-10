import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigatetoAura extends NavigationMixin(LightningElement) {
    navigateToAura(){
    
            this[NavigationMixin.Navigate]({ 
                type:"standard__component",
                attributes:{ 
                    componentName:"c__navigatetoauraTarget"
                },
                state:{ 
                    "c__id":"7876868687686"
                }
            })
        }
    }